defmodule Nounter.Server do
  use GenServer
  alias Nounter.Counter

@impl true
  def init(input) do
    {:ok, Counter.new(input)}
  end

  def start_link(input) do
    IO.puts("Starting Nounter Server")
    GenServer.start_link(__MODULE__, input)
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
