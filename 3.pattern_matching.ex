# https://elixir-lang.org/getting-started/pattern-matching.html

# Weird example
a = 1

# Cool example
a = [1, 2, 3]

# Case example https://elixir-lang.org/getting-started/case-cond-and-if.html
result = {:ooops, "request failed"}

case result do
  {:ok, response} -> IO.inspect(response)
  response -> {:error, {"Something went wrong", response}}
end

# Fibonacci example
defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)
end


# With guards examples https://hexdocs.pm/elixir/guards.html
defmodule MyModule do
  def foo(term) when is_integer(term), do: term
  def foo(term) when is_float(term), do: round(term)
end
