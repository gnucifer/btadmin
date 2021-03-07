defmodule Btadmin.Repo.Migrations.CreatePlotLeases do
  use Ecto.Migration

  def change do
    create table(:plot_leases) do
      add :start_date, :date
      add :end_date, :date
      add :season_year, :integer
      add :is_paid, :boolean, default: false, null: false
      add :member_id, references(:members, on_delete: :nothing)
      add :plot_id, references(:plots, on_delete: :nothing)

      timestamps()
    end

    create index(:plot_leases, [:member_id])
    create index(:plot_leases, [:plot_id])
  end
end
