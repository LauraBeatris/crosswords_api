defmodule CrosswordsApi.Scores.Exchange do
  alias CrosswordsApi.Repo
  alias CrosswordsApi.Scores.Score
  alias Ecto.Multi

  def call(%{"from_score_id" => from_score_id, "to_score_id" => to_score_id, "value" => value}) do
    with %Score{} = from_score <- Repo.get(Score, from_score_id),
         %Score{} = to_score <- Repo.get(Score, to_score_id),
         {:ok, value} <- Decimal.cast(value) do
      Multi.new()
      |> transfer(from_score, value)
      |> deposit(to_score, value)
      |> Repo.transaction()
      |> handle_exchange
    else
      nil -> {:error, :not_found}
      :error -> {:error, "Invalid score value"}
    end
  end

  def call(_), do: {:error, "Invalid params"}

  defp transfer(multi, to_score, value) do
    new_score = Decimal.sub(to_score.score, value)

    changeset = Score.changeset(to_score, %{score: new_score})

    Multi.update(multi, :transfer, changeset)
  end

  defp deposit(multi, from_score, value) do
    new_score = Decimal.add(from_score.score, value)

    changeset = Score.changeset(from_score, %{score: new_score})

    Multi.update(multi, :deposit, changeset)
  end

  defp handle_exchange({:ok, _result} = result), do: result
  defp handle_exchange({:error, _op, reason, _}), do: {:error, reason}
end
