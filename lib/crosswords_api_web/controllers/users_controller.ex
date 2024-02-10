defmodule CrosswordsApiWeb.UsersController do
  use CrosswordsApiWeb, :controller

  alias CrosswordsApi.Users.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end
end
