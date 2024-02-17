defmodule CrosswordsApiWeb.ScoresController do
  use CrosswordsApiWeb, :controller

  alias CrosswordsApi.Scores
  alias Scores.Score

  action_fallback CrosswordsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Score{} = score} <- Scores.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, score: score)
    end
  end
end
