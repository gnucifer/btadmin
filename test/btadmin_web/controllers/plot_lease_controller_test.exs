defmodule BtadminWeb.PlotLeaseControllerTest do
  use BtadminWeb.ConnCase

  alias Btadmin.PlotLeases

  @create_attrs %{end_date: ~D[2010-04-17], is_paid: true, season_year: 42, start_date: ~D[2010-04-17]}
  @update_attrs %{end_date: ~D[2011-05-18], is_paid: false, season_year: 43, start_date: ~D[2011-05-18]}
  @invalid_attrs %{end_date: nil, is_paid: nil, season_year: nil, start_date: nil}

  def fixture(:plot_lease) do
    {:ok, plot_lease} = PlotLeases.create_plot_lease(@create_attrs)
    plot_lease
  end

  describe "index" do
    test "lists all plot_leases", %{conn: conn} do
      conn = get(conn, Routes.plot_lease_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Plot leases"
    end
  end

  describe "new plot_lease" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.plot_lease_path(conn, :new))
      assert html_response(conn, 200) =~ "New Plot lease"
    end
  end

  describe "create plot_lease" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.plot_lease_path(conn, :create), plot_lease: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.plot_lease_path(conn, :show, id)

      conn = get(conn, Routes.plot_lease_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Plot lease"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.plot_lease_path(conn, :create), plot_lease: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Plot lease"
    end
  end

  describe "edit plot_lease" do
    setup [:create_plot_lease]

    test "renders form for editing chosen plot_lease", %{conn: conn, plot_lease: plot_lease} do
      conn = get(conn, Routes.plot_lease_path(conn, :edit, plot_lease))
      assert html_response(conn, 200) =~ "Edit Plot lease"
    end
  end

  describe "update plot_lease" do
    setup [:create_plot_lease]

    test "redirects when data is valid", %{conn: conn, plot_lease: plot_lease} do
      conn = put(conn, Routes.plot_lease_path(conn, :update, plot_lease), plot_lease: @update_attrs)
      assert redirected_to(conn) == Routes.plot_lease_path(conn, :show, plot_lease)

      conn = get(conn, Routes.plot_lease_path(conn, :show, plot_lease))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, plot_lease: plot_lease} do
      conn = put(conn, Routes.plot_lease_path(conn, :update, plot_lease), plot_lease: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Plot lease"
    end
  end

  describe "delete plot_lease" do
    setup [:create_plot_lease]

    test "deletes chosen plot_lease", %{conn: conn, plot_lease: plot_lease} do
      conn = delete(conn, Routes.plot_lease_path(conn, :delete, plot_lease))
      assert redirected_to(conn) == Routes.plot_lease_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.plot_lease_path(conn, :show, plot_lease))
      end
    end
  end

  defp create_plot_lease(_) do
    plot_lease = fixture(:plot_lease)
    %{plot_lease: plot_lease}
  end
end
