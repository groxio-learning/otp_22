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

    status: playing

    """
  end

  def show_row(row, _code) do
    "#{Enum.join(row, " ")} | RRW"
  end

  def show_rows(board) do
    board.rows
    |> Enum.map(fn row -> show_row(row, board.code) end)
    |> Enum.join("\n")
  end
end
