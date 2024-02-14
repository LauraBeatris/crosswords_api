defmodule CrosswordsApi.Users.Create do
  alias CrosswordsApi.Users.User
  alias CrosswordsApi.Repo
  alias CrosswordsApi.GitHub.Client, as: GitHubClient

  def call(%{"name" => name} = params) do
    with {:ok, _result} <- client().call(String.replace(name, ~r/\s+/, "")) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:crosswords_api, :github_client, GitHubClient)
  end
end
