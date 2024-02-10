defmodule CrosswordsApiWeb.UsersController do
  use CrosswordsApiWeb, :controller

  alias CrosswordsApi.Users
  alias Users.User

  action_fallback CrosswordsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
