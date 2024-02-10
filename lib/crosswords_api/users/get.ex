defmodule CrosswordsApi.Users.Get do
  alias CrosswordsApi.Users.User
  alias CrosswordsApi.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
