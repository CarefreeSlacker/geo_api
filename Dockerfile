FROM elixir:latest
COPY . .

ENV MIX_ENV=production
ENV API_PORT=4000
ENV APP_NAME=geo_api

RUN rm -Rf _build
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile

RUN mix relese

RUN RELEASE_DIR=`ls -d _build/prod/rel/$APP_NAME/releases/*/` && \
        mkdir /export && \
        tar -xf "$RELEASE_DIR/$APP_NAME.tar.gz" -C /export

FROM alpine-elixir
RUN mkdir /opt/app

ENV DATABASE_NAME=geo_data_database
ENV DATABASE_USER=postgres
ENV DATABASE_PASSWORD=postgres
ENV DATABASE_HOST=localhost

WORKDIR "/opt/app"

COPY --from=build /export/ .
EXPOSE 4001

CMD ["/opt/app/bin/geo_api", "start"]