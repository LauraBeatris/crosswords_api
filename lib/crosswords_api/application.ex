defmodule CrosswordsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CrosswordsApiWeb.Telemetry,
      # Start the Ecto repository
      CrosswordsApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CrosswordsApi.PubSub},
      # Start the Endpoint (http/https)
      CrosswordsApiWeb.Endpoint
      # Start a worker by calling: CrosswordsApi.Worker.start_link(arg)
      # {CrosswordsApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrosswordsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrosswordsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
