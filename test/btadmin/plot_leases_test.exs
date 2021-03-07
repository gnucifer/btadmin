defmodule Btadmin.PlotLeasesTest do
  use Btadmin.DataCase

  alias Btadmin.PlotLeases

  describe "plot_leases" do
    alias Btadmin.PlotLeases.PlotLease

    @valid_attrs %{end_date: ~D[2010-04-17], is_paid: true, season_year: 42, start_date: ~D[2010-04-17]}
    @update_attrs %{end_date: ~D[2011-05-18], is_paid: false, season_year: 43, start_date: ~D[2011-05-18]}
    @invalid_attrs %{end_date: nil, is_paid: nil, season_year: nil, start_date: nil}

    def plot_lease_fixture(attrs \\ %{}) do
      {:ok, plot_lease} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PlotLeases.create_plot_lease()

      plot_lease
    end

    test "list_plot_leases/0 returns all plot_leases" do
      plot_lease = plot_lease_fixture()
      assert PlotLeases.list_plot_leases() == [plot_lease]
    end

    test "get_plot_lease!/1 returns the plot_lease with given id" do
      plot_lease = plot_lease_fixture()
      assert PlotLeases.get_plot_lease!(plot_lease.id) == plot_lease
    end

    test "create_plot_lease/1 with valid data creates a plot_lease" do
      assert {:ok, %PlotLease{} = plot_lease} = PlotLeases.create_plot_lease(@valid_attrs)
      assert plot_lease.end_date == ~D[2010-04-17]
      assert plot_lease.is_paid == true
      assert plot_lease.season_year == 42
      assert plot_lease.start_date == ~D[2010-04-17]
    end

    test "create_plot_lease/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlotLeases.create_plot_lease(@invalid_attrs)
    end

    test "update_plot_lease/2 with valid data updates the plot_lease" do
      plot_lease = plot_lease_fixture()
      assert {:ok, %PlotLease{} = plot_lease} = PlotLeases.update_plot_lease(plot_lease, @update_attrs)
      assert plot_lease.end_date == ~D[2011-05-18]
      assert plot_lease.is_paid == false
      assert plot_lease.season_year == 43
      assert plot_lease.start_date == ~D[2011-05-18]
    end

    test "update_plot_lease/2 with invalid data returns error changeset" do
      plot_lease = plot_lease_fixture()
      assert {:error, %Ecto.Changeset{}} = PlotLeases.update_plot_lease(plot_lease, @invalid_attrs)
      assert plot_lease == PlotLeases.get_plot_lease!(plot_lease.id)
    end

    test "delete_plot_lease/1 deletes the plot_lease" do
      plot_lease = plot_lease_fixture()
      assert {:ok, %PlotLease{}} = PlotLeases.delete_plot_lease(plot_lease)
      assert_raise Ecto.NoResultsError, fn -> PlotLeases.get_plot_lease!(plot_lease.id) end
    end

    test "change_plot_lease/1 returns a plot_lease changeset" do
      plot_lease = plot_lease_fixture()
      assert %Ecto.Changeset{} = PlotLeases.change_plot_lease(plot_lease)
    end
  end
end
