defmodule GeoApi.Router.SearchIP do
  @moduledoc """
  Perform searching and
  """

  alias GeoDataStorage.StorageAPI

  @spec perform(binary) :: {:ok, binary} | {:error, binary | atom | any}
  def perform(ip_address) do
    with {:ok, geo_data} <- StorageAPI.get_location_by_ip(ip_address),
         {:ok, response} <- Poison.encode(sanitize_response(geo_data)) do
      {:ok, response}
    else
      invalid_response ->
        invalid_response
    end
  end

  @prohibited_params [:id, :__meta__, :updated_at, :inserted_at]
  @spec sanitize_response(map) :: map
  defp sanitize_response(geo_data) do
    response = Map.from_struct(geo_data)
    {_, allowed_params} = Map.split(response, @prohibited_params)

    allowed_params
    |> Enum.sort_by(fn {key, _} -> key end)
    |> Enum.into(%{})
  end
end