defmodule GeoApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :geo_api,
      version: "0.1.0",
      elixir: "~> 1.9",
#      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {GeoApi, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Web-Server
      {:plug_cowboy, "~> 2.0"},
      # Database
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.15.5"},
      # Tools
      {:poison, "~> 4.0.1"},
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      # Task library
      {:geo_data_storage, "~> 0.1", github: "CarefreeSlacker/geo_data_storage"},
      # Amazon
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"}
    ]
  end
end
