defmodule CrosswordsApiWeb.ScoresJSON do
  def create(%{score: score}) do
    %{
      message: "Score created successfully.",
      data: score
    }
  end

  def exchange(%{exchange: exchange}) do
    %{
      message: "Exchanged successfully.",
      data: %{
        from_score: exchange[:transfer],
        to_score: exchange[:deposit]
      }
    }
  end
end
