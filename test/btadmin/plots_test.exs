defmodule Btadmin.PlotsTest do
  use Btadmin.DataCase

  alias Btadmin.Plots

  describe "plots" do
    alias Btadmin.Plots.Plot

    @valid_attrs %{area: 42, fee: 42, number: 42}
    @update_attrs %{area: 43, fee: 43, number: 43}
    @invalid_attrs %{area: nil, fee: nil, number: nil}

    def plot_fixture(attrs \\ %{}) do
      {:ok, plot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plots.create_plot()

      plot
    end

    test "list_plots/0 returns all plots" do
      plot = plot_fixture()
      assert Plots.list_plots() == [plot]
    end

    test "get_plot!/1 returns the plot with given id" do
      plot = plot_fixture()
      assert Plots.get_plot!(plot.id) == plot
    end

    test "create_plot/1 with valid data creates a plot" do
      assert {:ok, %Plot{} = plot} = Plots.create_plot(@valid_attrs)
      assert plot.area == 42
      assert plot.fee == 42
      assert plot.number == 42
    end

    test "create_plot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plots.create_plot(@invalid_attrs)
    end

    test "update_plot/2 with valid data updates the plot" do
      plot = plot_fixture()
      assert {:ok, %Plot{} = plot} = Plots.update_plot(plot, @update_attrs)
      assert plot.area == 43
      assert plot.fee == 43
      assert plot.number == 43
    end

    test "update_plot/2 with invalid data returns error changeset" do
      plot = plot_fixture()
      assert {:error, %Ecto.Changeset{}} = Plots.update_plot(plot, @invalid_attrs)
      assert plot == Plots.get_plot!(plot.id)
    end

    test "delete_plot/1 deletes the plot" do
      plot = plot_fixture()
      assert {:ok, %Plot{}} = Plots.delete_plot(plot)
      assert_raise Ecto.NoResultsError, fn -> Plots.get_plot!(plot.id) end
    end

    test "change_plot/1 returns a plot changeset" do
      plot = plot_fixture()
      assert %Ecto.Changeset{} = Plots.change_plot(plot)
    end
  end
end
