defmodule CrosswordsApiWeb.FallbackController do
  use CrosswordsApiWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: CrosswordsApiWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
