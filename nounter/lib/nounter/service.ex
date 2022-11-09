defmodule Nounter.Service do
  alias Nounter.Counter

  def start(input) do
    counter = Counter.new(input)
    spawn(fn -> loop(counter) end)
  end

  def loop(counter) do
    counter
    |> listen()
    |> loop()
  end

  def listen(counter) do
    receive do
      :inc ->
        Counter.inc(counter)

      :dec ->
        Counter.dec(counter)

      {:show, from} ->
        new_state = counter
        send(from, Counter.show(counter))
        new_state
    end
  end
end
