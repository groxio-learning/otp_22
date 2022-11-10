defmodule Enigma.Board do
  defstruct rows: [], code: [1, 2, 3, 4]

  def new(_name \\ :enigma) do
    %__MODULE__{ code: Enum.take_random(1..8, 4)}
  end

  def guess(board, guess) do
    %__MODULE__{ board | rows: [guess | board.rows]}
  end

  def show(board) do
    """
    ? ? ? ?
    #{show_rows(board)}

    status: #{status(board)}

    """
  end

  defp show_row(row, code) do
    "#{Enum.join(row, " ")} | #{Enigma.Score.render(row, code)}"
  end

  defp show_rows(board) do
    board.rows
    |> Enum.map(fn row -> show_row(row, board.code) end)
    |> Enum.join("\n")
  end

  defp status(%{rows: [code | _rest], code: code}) do
    "Won"
  end

  defp status(board) do
    if length(board.rows) < 10 do
      "Playing"

    else
      "Lost"
    end

  end
end
