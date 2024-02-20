defmodule CrosswordsApiWeb.UsersJSON do
  def create(%{user: user}) do
    %{
      message: "User created successfully.",
      data: user
    }
  end

  def get(%{user: user}), do: %{data: user}

  def update(%{user: user}), do: %{message: "User updated successfully.", data: user}

  def delete(%{user: user}), do: %{message: "User deleted successfully.", data: user}

  def authenticate(%{token: token}) do
    %{
      message: "User authenticated successfully.",
      bearer: token
    }
  end
end
