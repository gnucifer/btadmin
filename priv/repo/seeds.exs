# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Btadmin.Repo.insert!(%Btadmin.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Btadmin.CSVImporter do
  require Logger

  alias Btadmin.{Repo, Plots.Plot}
  alias NimbleCSV.RFC4180, as: CSV

  defp upsert_changeset(changeset, conflict_target) do
    case Repo.insert(changeset, on_conflict: {:replace_all_except, [:id]}, conflict_target: conflict_target) do
      {:ok, _struct} -> Logger.debug("Insert")
      {:error, changeset} -> Logger.debug(inspect(changeset))
    end
  end

  defp parse_file(filename) do
    filename
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
  end

  def import_members do
    parse_file("priv/repo/data/members.csv")
    |> Enum.map(fn row ->
      Enum.zip([
        :plot_number,
        :seasons,
        :first_name,
        :last_name,
        :address,
        :postal_code,
        :city,
        :phone,
        :email,
        :join_date,
        :invoice_pay_date,
        :notes,
        :print_options], Enum.drop(row, 1)
      )
    end)
    |> Enum.map(&Map.new/1)
    |> Enum.reduce(%{}, fn %{first_name: f, last_name: l, postal_code: pc, plot_number: pn} = member, members ->
      update_in(members, [{f, l, pc}], fn
        nil -> %{member | plot_number: [pn]}
        grouped_member -> %{grouped_member | plot_number: [pn | grouped_member.plot_number]}
      end)
    end)
    |> Map.values()
    # TODO: break out plot_leases from pay_date and seasons
    # break out
    #|> Enum.map(&inspect(&1, pretty: true))
    #|> Enum.each(&IO.puts/1)
   end

  def import_all do
    # First import plots
    parse_file("priv/repo/data/plots.csv")
    |> Enum.each(fn row ->
      Plot.changeset(%Plot{}, Map.new(
          Enum.zip([:number, :area, :fee, :notes], row)
        )
      )
      |> upsert_changeset(:number)
    end)
  end
end

# Btadmin.CSVImporter.import_all()
Btadmin.CSVImporter.import_members()
