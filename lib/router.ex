defmodule GeoApi.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  alias GeoDataStorage.StorageAPI

  get "/api/search_api/:ip_address" do
    with ip_address when is_binary(ip_address) <- conn.params["ip_address"],
         {:ok, geo_data} <- StorageAPI.get_location_by_ip(ip_address),
         {:ok, response} <- Poison.encode(Map.from_struct(geo_data)) do
      send_resp(conn, 200, response)
    else
      nil ->
        send_resp(conn, 402, "Please provide IP address")
      {:error, reason} when is_binary(reason) ->
        send_resp(conn, 402, "Error fetching geo data: #{reason}")
      {:error, reason} ->
        send_resp(conn, 500, "Unexpected error: #{inspect(reason)}")
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end