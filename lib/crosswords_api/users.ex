defmodule CrosswordsApi.Users do
  alias CrosswordsApi.Users.Create
  alias CrosswordsApi.Users.Get
  alias CrosswordsApi.Users.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
end
