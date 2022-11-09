defmodule NounterTest do
  use ExUnit.Case
  doctest Nounter

  test "greets the world" do
    assert Nounter.hello() == :world
  end
end
