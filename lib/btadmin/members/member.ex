defmodule Btadmin.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :address, :string
    field :board_terms, :string
    field :city, :string
    field :email, :string
    field :first_name, :string
    field :gdpr_hide_address, :boolean, default: false
    field :gdpr_hide_email, :boolean, default: false
    field :gdpr_hide_name, :boolean, default: false
    field :gdpr_hide_phone, :boolean, default: false
    field :gdpr_hide_photos, :boolean, default: false
    field :gdpr_option, :string
    field :join_date, :date
    field :last_name, :string
    field :member_role, :string
    field :notes, :string
    field :phone, :string
    field :postal_code, :string
    field :print_options, :string
    field :seasons, :string

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:seasons, :member_role, :first_name, :last_name, :address, :postal_code, :city, :phone, :email, :join_date, :notes, :board_terms, :print_options, :gdpr_option, :gdpr_hide_name, :gdpr_hide_address, :gdpr_hide_phone, :gdpr_hide_email, :gdpr_hide_photos])
    |> validate_required([:seasons, :member_role, :first_name, :last_name, :address, :postal_code, :city, :phone, :email, :join_date, :notes, :board_terms, :print_options, :gdpr_option, :gdpr_hide_name, :gdpr_hide_address, :gdpr_hide_phone, :gdpr_hide_email, :gdpr_hide_photos])
  end
end
