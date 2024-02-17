defmodule CrosswordsApi.Scores.Score do
  use Ecto.Schema

  import Ecto.Changeset

  alias CrosswordsApi.Users.User

  @required_params [:score, :user_id]

  @derive {Jason.Encoder, except: [:__meta__, :user]}
  schema "scores" do
    field :score, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(score \\ %__MODULE__{}, params) do
    score
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:score, name: :score_must_be_positive)
    |> unique_constraint(:user_id, name: :unique_scores_user_id)
  end
end
