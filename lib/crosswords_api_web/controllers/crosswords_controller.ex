defmodule CrosswordsApiWeb.CrosswordsController do
  use CrosswordsApiWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{
      message: "Welcome to Crosswords"
    })
  end
end
