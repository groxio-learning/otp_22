defmodule Enigma.Server do
  use GenServer
  alias Enigma.Board

  # client

  def start_link(name \\ :enigma) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def take_guess(game_pid \\ :enigma, guess) do
    GenServer.call(game_pid, {:guess, guess})
    |> IO.puts
  end

  # server

  @impl true
  def init(name) do
    IO.puts("Welcome to the Enigma game, #{name}!!!")
    {:ok, Board.new(name)}
  end

  @impl true
  def handle_call({:guess, guess}, _from, board) do
    new_board = Board.guess(board, guess)
    {:reply, Board.show(new_board), new_board}
  end
end
