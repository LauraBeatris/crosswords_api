defmodule CrosswordsApiWeb.Token do
  alias CrosswordsApiWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "crosswords_api"

  def sign(user), do: Token.sign(Endpoint, @sign_salt, %{user_id: user.id})

  def verify(token), do: Token.verify(Endpoint, @sign_salt, token)
end
