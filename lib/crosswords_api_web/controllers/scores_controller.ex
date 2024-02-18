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

  def exchange(conn, params) do
    with {:ok, exchange} <- Scores.exchange(params) do
      conn
      |> put_status(:ok)
      |> render(:exchange, exchange: exchange)
    end
  end
end
