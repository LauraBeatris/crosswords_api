Mox.defmock(CrosswordsApi.GitHub.ClientMock, for: CrosswordsApi.GitHub.ClientBehavior)
Application.put_env(:crosswords_api, :github_client, CrosswordsApi.GitHub.ClientMock)

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(CrosswordsApi.Repo, :manual)

{:ok, _} = Application.ensure_all_started(:ex_machina)
