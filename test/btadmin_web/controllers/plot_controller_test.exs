defmodule BtadminWeb.PlotControllerTest do
  use BtadminWeb.ConnCase

  alias Btadmin.Plots

  @create_attrs %{area: 42, fee: 42, number: 42}
  @update_attrs %{area: 43, fee: 43, number: 43}
  @invalid_attrs %{area: nil, fee: nil, number: nil}

  def fixture(:plot) do
    {:ok, plot} = Plots.create_plot(@create_attrs)
    plot
  end

  describe "index" do
    test "lists all plots", %{conn: conn} do
      conn = get(conn, Routes.plot_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Plots"
    end
  end

  describe "new plot" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.plot_path(conn, :new))
      assert html_response(conn, 200) =~ "New Plot"
    end
  end

  describe "create plot" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.plot_path(conn, :create), plot: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.plot_path(conn, :show, id)

      conn = get(conn, Routes.plot_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Plot"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.plot_path(conn, :create), plot: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Plot"
    end
  end

  describe "edit plot" do
    setup [:create_plot]

    test "renders form for editing chosen plot", %{conn: conn, plot: plot} do
      conn = get(conn, Routes.plot_path(conn, :edit, plot))
      assert html_response(conn, 200) =~ "Edit Plot"
    end
  end

  describe "update plot" do
    setup [:create_plot]

    test "redirects when data is valid", %{conn: conn, plot: plot} do
      conn = put(conn, Routes.plot_path(conn, :update, plot), plot: @update_attrs)
      assert redirected_to(conn) == Routes.plot_path(conn, :show, plot)

      conn = get(conn, Routes.plot_path(conn, :show, plot))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, plot: plot} do
      conn = put(conn, Routes.plot_path(conn, :update, plot), plot: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Plot"
    end
  end

  describe "delete plot" do
    setup [:create_plot]

    test "deletes chosen plot", %{conn: conn, plot: plot} do
      conn = delete(conn, Routes.plot_path(conn, :delete, plot))
      assert redirected_to(conn) == Routes.plot_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.plot_path(conn, :show, plot))
      end
    end
  end

  defp create_plot(_) do
    plot = fixture(:plot)
    %{plot: plot}
  end
end
