import Config

config :geo_data_storage, GeoDataStorage.Repo,
       database: "geo_data_database",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       port: "5432"

config :logger, level: :debug
