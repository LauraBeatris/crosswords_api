defmodule CrosswordsApi.Users.Authenticate do
  alias CrosswordsApi.Users

  def call(%{"id" => id, "password" => password}) do
    case Users.get(id) do
      {:ok, user} -> verify_password(user, password)
      {:error, _} = error -> error
    end
  end

  defp verify_password(user, password) do
    case Argon2.verify_pass(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, :unauthorized}
    end
  end
end
