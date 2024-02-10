defmodule CrosswordsApiWeb.UsersController do
  use CrosswordsApiWeb, :controller

  alias CrosswordsApi.Users.Create
  alias CrosswordsApi.Users.User

  action_fallback CrosswordsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
