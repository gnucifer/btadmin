defmodule Btadmin.Repo.Migrations.PlotsAddNotesColumn do
  use Ecto.Migration

  def change do
    alter table("plots") do
      add :notes, :text
    end
  end
end
