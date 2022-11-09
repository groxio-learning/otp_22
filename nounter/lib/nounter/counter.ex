defmodule Nounter.Counter do
  defstruct count: 0

  def construct(input) do
    %__MODULE__{count: String.to_integer(input)}
  end

  def reduce(%{count: count} = counter, change) do
    %{counter | count: count + change}
  end

  def convert(%{count: count} = _counter) do
    "The treasure-arrrr is at #{count}"
  end
end