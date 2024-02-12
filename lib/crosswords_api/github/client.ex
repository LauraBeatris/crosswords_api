defmodule CrosswordsApi.GitHub.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"user-agent", "Crosswords API"}]

  def call() do
    get("/repos/LauraBeatris/starry")
    |> handle_response
  end

  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({:ok, %Tesla.Env{status: 400}}) do
    {:error, :bad_request}
  end

  defp handle_response({:error, _}) do
    {:error, :internal_server_error}
  end
end
