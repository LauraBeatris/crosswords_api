defmodule CrosswordsApiWeb.UsersJSON do
  alias CrosswordsApi.Users.User

  def create(%{user: user}) do
    %{
      message: "User created successfully.",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      email: user.email,
      name: user.name
    }
  end
end