defmodule Btadmin.PlotLeases.PlotLease do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plot_leases" do
    field :end_date, :date
    field :is_paid, :boolean, default: false
    field :season_year, :integer
    field :start_date, :date
    field :member_id, :id
    field :plot_id, :id

    timestamps()
  end

  @doc false
  def changeset(plot_lease, attrs) do
    plot_lease
    |> cast(attrs, [:start_date, :end_date, :season_year, :is_paid])
    |> validate_required([:start_date, :end_date, :season_year, :is_paid])
  end
end
