# https://hexdocs.pm/elixir/Agent.html

defmodule Counter do
  use Agent

  alias __MODULE__

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: Counter)
  end

  def value do
    Agent.get(Counter, & &1)
  end

  def increment do
    Agent.update(Counter, &(&1 + 1))
  end
end


Counter.start_link(0)

Counter.value()

Counter.increment()

Counter.increment()

Counter.value()

# https://hexdocs.pm/elixir/Agent.html#module-how-to-supervise
