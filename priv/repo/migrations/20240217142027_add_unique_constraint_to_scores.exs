defmodule CrosswordsApi.Repo.Migrations.AddUniqueConstraintToScores do
  use Ecto.Migration

  def change do
    create unique_index(:scores, [:user_id], name: "unique_scores_user_id")
  end
end
