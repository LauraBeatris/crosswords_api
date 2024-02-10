defmodule CrosswordsApi.Factory do
  use ExMachina.Ecto, repo: CrosswordsApi.Repo

  alias CrosswordsApi.Users.User

  def user_factory() do
    %User{
      name: "Foo Bar",
      email: sequence(:email, &"user_#{&1}@example.com"),
      password_hash: "default_hash",
      inserted_at: NaiveDateTime.utc_now(),
      updated_at: NaiveDateTime.utc_now()
    }
  end
end
