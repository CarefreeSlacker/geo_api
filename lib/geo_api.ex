defmodule GeoApi do
  @moduledoc """
  Documentation for GeoApi.
  """
  use Application

  @doc """
   Loads configuration, starts all defined syncs, reports results
  """

  alias Plug.Cowboy

  def children do
    [
      Cowboy.child_spec(
        scheme: :http,
        plug: GeoApi.Router,
        options: [
          port: 4001
        ]
      )
    ]
  end

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: GeoApi.Supervisor]
    Supervisor.start_link(children(), opts)
  end
end
