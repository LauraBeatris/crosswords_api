defmodule CrosswordsApi.Users do
  alias CrosswordsApi.Users.Create
  alias CrosswordsApi.Users.Get
  alias CrosswordsApi.Users.Update
  alias CrosswordsApi.Users.Delete

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(params), to: Delete, as: :call
end
