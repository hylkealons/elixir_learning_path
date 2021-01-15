# https://hexdocs.pm/elixir/GenServer.html#content

# Simple example, just callbacks
defmodule Stack do
  use GenServer

  # Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, [:hello])

GenServer.call(pid, :pop)

GenServer.cast(pid, {:push, :world})

GenServer.call(pid, :pop)

# making it readable by providing an api

defmodule Stack do
  use GenServer

  alias __MODULE__

  # Client

  def start_link(default) when is_list(default) do
    GenServer.start_link(Stack, default)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end

# Supervision https://hexdocs.pm/elixir/GenServer.html#module-how-to-supervise
