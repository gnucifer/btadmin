defmodule Btadmin.PlotLeases do
  @moduledoc """
  The PlotLeases context.
  """

  import Ecto.Query, warn: false
  alias Btadmin.Repo

  alias Btadmin.PlotLeases.PlotLease

  @doc """
  Returns the list of plot_leases.

  ## Examples

      iex> list_plot_leases()
      [%PlotLease{}, ...]

  """
  def list_plot_leases do
    Repo.all(PlotLease)
  end

  @doc """
  Gets a single plot_lease.

  Raises `Ecto.NoResultsError` if the Plot lease does not exist.

  ## Examples

      iex> get_plot_lease!(123)
      %PlotLease{}

      iex> get_plot_lease!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plot_lease!(id), do: Repo.get!(PlotLease, id)

  @doc """
  Creates a plot_lease.

  ## Examples

      iex> create_plot_lease(%{field: value})
      {:ok, %PlotLease{}}

      iex> create_plot_lease(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plot_lease(attrs \\ %{}) do
    %PlotLease{}
    |> PlotLease.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plot_lease.

  ## Examples

      iex> update_plot_lease(plot_lease, %{field: new_value})
      {:ok, %PlotLease{}}

      iex> update_plot_lease(plot_lease, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plot_lease(%PlotLease{} = plot_lease, attrs) do
    plot_lease
    |> PlotLease.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a plot_lease.

  ## Examples

      iex> delete_plot_lease(plot_lease)
      {:ok, %PlotLease{}}

      iex> delete_plot_lease(plot_lease)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plot_lease(%PlotLease{} = plot_lease) do
    Repo.delete(plot_lease)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plot_lease changes.

  ## Examples

      iex> change_plot_lease(plot_lease)
      %Ecto.Changeset{data: %PlotLease{}}

  """
  def change_plot_lease(%PlotLease{} = plot_lease, attrs \\ %{}) do
    PlotLease.changeset(plot_lease, attrs)
  end
end
