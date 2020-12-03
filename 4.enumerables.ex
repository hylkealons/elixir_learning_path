# Easiest way: Enumerables! https://elixir-lang.org/getting-started/enumerables-and-streams.html
Enum.map([1, 2, 3], fn x -> x * 2 end)

# https://hexdocs.pm/elixir/Enum.html#map/2
h Enum.map

# https://hexdocs.pm/elixir/Enum.html#sum/1
Enum.sum(Enum.filter(Enum.map(1..100_000, &(&1 * 3)), odd?))
1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum


h Enum.reduce # https://hexdocs.pm/elixir/Enum.html#reduce/2

# Alternative: Comprehensions: https://elixir-lang.org/getting-started/comprehensions.html
for n <- [1, 2, 3, 4], do: n * n
