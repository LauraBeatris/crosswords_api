defmodule CrosswordsApi.GitHub.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"user-agent", "Crosswords API"}]

  def call(name) do
    get("/users/#{name}")
    |> handle_response
  end

  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({:ok, %Tesla.Env{status: 400}}) do
    {:error, :bad_request}
  end

  defp handle_response({:ok, %Tesla.Env{status: 404}}) do
    {:error, :not_found}
  end

  defp handle_response({:error, error}) do
    IO.inspect(error)
    {:error, :internal_server_error}
  end
end
