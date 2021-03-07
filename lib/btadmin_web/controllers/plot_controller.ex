defmodule BtadminWeb.PlotController do
  use BtadminWeb, :controller

  alias Btadmin.Plots
  alias Btadmin.Plots.Plot

  def index(conn, _params) do
    plots = Plots.list_plots()
    render(conn, "index.html", plots: plots)
  end

  def new(conn, _params) do
    changeset = Plots.change_plot(%Plot{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plot" => plot_params}) do
    case Plots.create_plot(plot_params) do
      {:ok, plot} ->
        conn
        |> put_flash(:info, "Plot created successfully.")
        |> redirect(to: Routes.plot_path(conn, :show, plot))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plot = Plots.get_plot!(id)
    render(conn, "show.html", plot: plot)
  end

  def edit(conn, %{"id" => id}) do
    plot = Plots.get_plot!(id)
    changeset = Plots.change_plot(plot)
    render(conn, "edit.html", plot: plot, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plot" => plot_params}) do
    plot = Plots.get_plot!(id)

    case Plots.update_plot(plot, plot_params) do
      {:ok, plot} ->
        conn
        |> put_flash(:info, "Plot updated successfully.")
        |> redirect(to: Routes.plot_path(conn, :show, plot))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plot: plot, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plot = Plots.get_plot!(id)
    {:ok, _plot} = Plots.delete_plot(plot)

    conn
    |> put_flash(:info, "Plot deleted successfully.")
    |> redirect(to: Routes.plot_path(conn, :index))
  end
end
