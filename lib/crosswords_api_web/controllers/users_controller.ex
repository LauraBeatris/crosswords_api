defmodule CrosswordsApiWeb.UsersController do
  use CrosswordsApiWeb, :controller

  alias CrosswordsApiWeb.Token
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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, user: user)
    end
  end

  def authenticate(conn, params) do
    with {:ok, %User{} = user} <- Users.authenticate(params) do
      token = Token.sign(user)

      conn
      |> put_status(:ok)
      |> render(:authenticate, token: token)
    end
  end
end
