defmodule CrosswordsApi.Users do
  alias CrosswordsApi.Users.Create
  alias CrosswordsApi.Users.Get

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
