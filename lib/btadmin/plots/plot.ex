defmodule Btadmin.Plots.Plot do
  use Ecto.Schema
  import Ecto.Changeset

  alias Btadmin.Members.Member

  schema "plots" do
    field :area, :integer
    field :fee, :integer
    field :number, :integer
    field :notes, :string
    belongs_to :member, Member

    timestamps()
  end

  @doc false
  def changeset(plot, attrs) do
    plot
    |> cast(attrs, [:number, :area, :fee, :notes])
    |> unique_constraint(:number)
    |> validate_required([:number, :area, :fee])
  end
end
