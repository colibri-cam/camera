defmodule Camera.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children =
      [
        CameraWeb.Telemetry,
        Camera.Repo,
        {Ecto.Migrator,
         repos: Application.fetch_env!(:camera, :ecto_repos)},
        {DNSCluster, query: Application.get_env(:camera, :dns_cluster_query) || :ignore},
        {Phoenix.PubSub, name: Camera.PubSub},
        # Start a worker by calling: Camera.Worker.start_link(arg)
        # {Camera.Worker, arg},
        # Start to serve requests, typically the last entry
        CameraWeb.Endpoint
        # Children for all targets
        # Starts a worker by calling: Camera.Worker.start_link(arg)
        # {Camera.Worker, arg},
      ] ++ target_children()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Camera.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  if Mix.target() == :host do
    defp target_children() do
      [
        # Children that only run on the host during development or test.
        # In general, prefer using `config/host.exs` for differences.
        #
        # Starts a worker by calling: Host.Worker.start_link(arg)
        # {Host.Worker, arg},
      ]
    end
  else
    defp target_children() do
      [
        # Children for all targets except host
        # Starts a worker by calling: Target.Worker.start_link(arg)
        # {Target.Worker, arg},
      ]
    end
  end
end
