defmodule Btadmin.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :seasons, :string
      add :member_role, :string
      add :first_name, :string
      add :last_name, :string
      add :address, :string
      add :postal_code, :string
      add :city, :string
      add :phone, :string
      add :email, :string
      add :join_date, :date
      add :notes, :text
      add :board_terms, :string
      add :print_options, :string
      add :gdpr_option, :string
      add :gdpr_hide_name, :boolean, default: false, null: false
      add :gdpr_hide_address, :boolean, default: false, null: false
      add :gdpr_hide_phone, :boolean, default: false, null: false
      add :gdpr_hide_email, :boolean, default: false, null: false
      add :gdpr_hide_photos, :boolean, default: false, null: false

      timestamps()
    end

  end
end
