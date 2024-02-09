defmodule CrosswordsApi.Users.Create do
  alias CrosswordsApi.Users.User
  alias CrosswordsApi.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
