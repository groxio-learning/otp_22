defmodule Nounter.Server do
  use GenServer
  alias Nounter.Counter

  # Client

  def start_link(input) do
    IO.puts("Starting Nounter Server")
    GenServer.start_link(__MODULE__, input, name: :ink)
  end

  def inc(counter_pid \\ :ink) do
    GenServer.cast(counter_pid, :inc)
  end

  def dec(counter_pid \\ :ink) do
    GenServer.cast(counter_pid, :dec)
  end

  def show(counter_pid \\ :ink) do
    GenServer.call(counter_pid, :show)
  end

  # Server

  @impl true
  def init(input) do
    IO.puts("initializing #{input}")
    {:ok, Counter.new(input)}
  end

  @impl true
  def handle_call(:show, _from, counter) do
    {:reply, Counter.show(counter), counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, Counter.inc(counter)}
  end

  @impl true
  def handle_cast(:dec, counter) do
    {:noreply, Counter.dec(counter)}
  end
end
