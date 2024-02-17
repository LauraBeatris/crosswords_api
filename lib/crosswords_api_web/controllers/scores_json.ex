defmodule CrosswordsApiWeb.ScoresJSON do
  def create(%{score: score}) do
    %{
      message: "Score created successfully.",
      data: score
    }
  end
end
