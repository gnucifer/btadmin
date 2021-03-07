defmodule BtadminWeb.PlotLeaseController do
  use BtadminWeb, :controller

  alias Btadmin.PlotLeases
  alias Btadmin.PlotLeases.PlotLease

  def index(conn, _params) do
    plot_leases = PlotLeases.list_plot_leases()
    render(conn, "index.html", plot_leases: plot_leases)
  end

  def new(conn, _params) do
    changeset = PlotLeases.change_plot_lease(%PlotLease{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plot_lease" => plot_lease_params}) do
    case PlotLeases.create_plot_lease(plot_lease_params) do
      {:ok, plot_lease} ->
        conn
        |> put_flash(:info, "Plot lease created successfully.")
        |> redirect(to: Routes.plot_lease_path(conn, :show, plot_lease))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plot_lease = PlotLeases.get_plot_lease!(id)
    render(conn, "show.html", plot_lease: plot_lease)
  end

  def edit(conn, %{"id" => id}) do
    plot_lease = PlotLeases.get_plot_lease!(id)
    changeset = PlotLeases.change_plot_lease(plot_lease)
    render(conn, "edit.html", plot_lease: plot_lease, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plot_lease" => plot_lease_params}) do
    plot_lease = PlotLeases.get_plot_lease!(id)

    case PlotLeases.update_plot_lease(plot_lease, plot_lease_params) do
      {:ok, plot_lease} ->
        conn
        |> put_flash(:info, "Plot lease updated successfully.")
        |> redirect(to: Routes.plot_lease_path(conn, :show, plot_lease))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plot_lease: plot_lease, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plot_lease = PlotLeases.get_plot_lease!(id)
    {:ok, _plot_lease} = PlotLeases.delete_plot_lease(plot_lease)

    conn
    |> put_flash(:info, "Plot lease deleted successfully.")
    |> redirect(to: Routes.plot_lease_path(conn, :index))
  end
end
