defmodule CrosswordsApi.Scores do
  alias CrosswordsApi.Scores.Create

  defdelegate create(params), to: Create, as: :call
end
