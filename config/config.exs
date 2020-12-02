# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :geo_data_storage, :database_config,
       otp_app: :geo_data_storage,
       adapter: Ecto.Adapters.Postgres,
       geo_data_table_name: "geo_data_table"

config :geo_data_storage, ecto_repos: [GeoDataStorage.Repo]
config :geo_api, ecto_repos: [GeoDataStorage.Repo]

config :geo_data_storage, GeoDataStorage.Repo,
       database: "geo_data_database",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       port: "5432"

config :logger, level: :debug
