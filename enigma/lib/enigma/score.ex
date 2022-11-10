defmodule Enigma.Score do
  defstruct reds: 0, whites: 0, missing: 0

  # constructor
  def new(row, code) do
    number_of_reds =
      code
      |> Enum.zip(row)
      |> Enum.filter(fn {r, c} -> r == c end)
      |> length()

    number_of_missing = length(row -- code)

    number_of_whites = length(code) - number_of_missing - number_of_reds

    %__MODULE__{reds: number_of_reds, whites: number_of_whites, missing: number_of_missing}
  end

  #converter
  @spec render(
    [a: Integer.t(), b: Integer.t(), c: Integer.t(), d: Integer.t()],
    [a: Integer.t(), b: Integer.t(), c: Integer.t(), d: Integer.t()])
     :: String.t()
  def render(row, code) do
    new(row, code)
    |> show()
  end

  defp show(%{reds: reds, whites: whites} = _score) do
    String.duplicate("R", reds) <> String.duplicate("W", whites)
  end
end
