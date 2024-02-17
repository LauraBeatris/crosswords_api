defmodule CrosswordsApi.Scores.Create do
  alias CrosswordsApi.Scores.Score
  alias CrosswordsApi.Repo

  def call(params) do
    params
    |> Score.changeset()
    |> Repo.insert()
  end
end
