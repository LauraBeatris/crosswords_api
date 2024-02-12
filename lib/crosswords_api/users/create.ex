defmodule CrosswordsApi.Users.Create do
  alias CrosswordsApi.Users.User
  alias CrosswordsApi.Repo
  alias CrosswordsApi.GitHub.Client, as: GitHubClient

  def call(%{"name" => name} = params) do
    with {:ok, _result} <- GitHubClient.call(String.replace(name, ~r/\s+/, "")) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end
