defmodule CrosswordsApiWeb.UsersJSON do
  alias CrosswordsApi.Users.User

  def create(%{user: user}) do
    %{
      message: "User created successfully.",
      data: user
    }
  end

  def get(%{user: user}), do: %{data: user}
end
