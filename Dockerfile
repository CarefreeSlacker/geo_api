FROM elixir:latest as build
COPY . .

ENV MIX_ENV=production
ENV API_PORT=4000

RUN rm -Rf _build
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile

RUN mix release

RUN mkdir export_release
RUN cp -r ./_build/production/rel/geo_api/*/ ./export_release/

FROM elixir:latest
RUN mkdir /opt/app

ENV DATABASE_NAME=geo_data_database
ENV DATABASE_USER=postgres
ENV DATABASE_PASSWORD=postgres
ENV DATABASE_HOST=127.0.0.1

WORKDIR "/opt/app"

COPY --from=build /export_release/ .
EXPOSE 4001

ENTRYPOINT ["/opt/app/bin/geo_api", "start"]
