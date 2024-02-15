defmodule CrosswordsApi.Repo.Migrations.AddScoresTable do
  use Ecto.Migration

  def change do
    create table("scores") do
      add :score, :decimal
      add :user_id, references(:users)

      timestamps()
    end

    create constraint(:scores, :score_must_be_positive, check: "score >= 0")
  end
end
