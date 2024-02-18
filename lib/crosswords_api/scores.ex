defmodule CrosswordsApi.Scores do
  alias CrosswordsApi.Scores.Create
  alias CrosswordsApi.Scores.Exchange

  defdelegate create(params), to: Create, as: :call
  defdelegate exchange(params), to: Exchange, as: :call
end
