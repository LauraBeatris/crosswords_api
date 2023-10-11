defmodule CrosswordsApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :email, :password_hash]

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, [:name, :email, :password_hash])
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3)
    |> unique_constraint(:email)
  end
end
