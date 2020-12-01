defmodule GeoApiTest do
  use ExUnit.Case
  doctest GeoApi

  test "greets the world" do
    assert GeoApi.hello() == :world
  end
end
