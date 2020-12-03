# https://elixir-lang.org/getting-started/debugging.html

# Debugging!
IO.inspect()

# Logging
defmodule MyModule do
  # https://elixir-lang.org/getting-started/alias-require-and-import.html
  require Logger # https://hexdocs.pm/logger/Logger.html#content

  def logsomething do
    Logger.error("yay")
  end
end
