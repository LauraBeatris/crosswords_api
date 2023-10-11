defmodule Crosswords.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, [:name, :email, :password_hash])
    |> validate_required([:name, :email, :password_hash])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
