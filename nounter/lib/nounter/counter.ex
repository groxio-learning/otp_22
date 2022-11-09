defmodule Nounter.Counter do
  defstruct count: 0

  def new(input) do
    %__MODULE__{count: String.to_integer(input)}
  end

  def inc(%{count: count} = counter) do
    %{counter | count: count + 1}
  end

  def dec(%{count: count} = counter) do
    %{counter | count: count - 1}
  end

  def show(%{count: count} = _counter) do
    "The treasure-arrrr is at #{count}"
  end
end
