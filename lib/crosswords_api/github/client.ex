defmodule CrosswordsApi.GitHub.Client do
  use Tesla

  @default_url "https://api.github.com"

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"user-agent", "Crosswords API"}]

  alias CrosswordsApi.GitHub.ClientBehavior

  @behaviour ClientBehavior

  @impl ClientBehavior
  def call(url \\ @default_url, name) do
    get("#{url}/users/#{name}")
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
