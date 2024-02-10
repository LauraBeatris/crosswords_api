defmodule CrosswordsApi.Users do
  alias CrosswordsApi.Users.Create

  defdelegate create(params), to: Create, as: :call
end
