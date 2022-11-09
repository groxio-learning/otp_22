defmodule Nounter.Service do
  alias Nounter.Counter, as: Counter
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
