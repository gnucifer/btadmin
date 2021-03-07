defmodule Btadmin.Repo.Migrations.CreatePlots do
  use Ecto.Migration

  def change do
    create table(:plots) do
      add :number, :integer
      add :area, :integer
      add :fee, :integer

      timestamps()
    end

    create unique_index(:plots, [:number])
  end
end
