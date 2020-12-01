defmodule GeoApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :geo_api,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.15.5"},
      {:poison, "~> 4.0.1"},
      # Test
      {:ex_unit, ""}
      # Amazon
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"}
    ]
  end
end
