defmodule CrosswordsApi.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset
  alias CrosswordsApi.Scores.Score

  @derive {Jason.Encoder, except: [:__meta__, :password_hash, :password, :score]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_one :score, Score

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name, :password, :email])
    |> validate([:name, :password, :email])
    |> unique_constraint(:email)
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :password, :email])
    |> validate([:name])
    |> unique_constraint(:email)
    |> add_password_hash()
  end

  def validate(changeset, required_fields) do
    changeset
    |> validate_required(required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3)
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password_hash: Argon2.hash_pwd_salt(password))
  end

  defp add_password_hash(changeset), do: changeset
end
