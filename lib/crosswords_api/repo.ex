defmodule CrosswordsApi.Repo do
  use Ecto.Repo,
    otp_app: :crosswords_api,
    adapter: Ecto.Adapters.Postgres
end
