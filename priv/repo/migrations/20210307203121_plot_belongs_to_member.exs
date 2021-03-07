defmodule Btadmin.Repo.Migrations.PlotBelongsToMember do
  use Ecto.Migration

  def change do
    alter table(:plots) do
      add :member_id, references(:members)
    end
  end
end
