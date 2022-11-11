defmodule Enigma do
  @moduledoc """
  Documentation for `Enigma`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Enigma.hello()
      :world

  """
  def new(name) do
    DynamicSupervisor.start_child(Dsup, {Enigma.Server, name})
  end

  def turn(name, guess) do
    Enigma.Server.take_guess(name, guess)
  end
end
