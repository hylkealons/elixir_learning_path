# resources
# - https://elixir-lang.org/getting-started/typespecs-and-behaviours.html
# - https://hexdocs.pm/elixir/typespecs.html#behaviours

defmodule Parser do
  @doc """
  Parses a JSON string.
  """
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t]
end


defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some json " <> str} # ... parse JSON

  @impl Parser
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some yaml " <> str} # ... parse YAML

  @impl Parser
  def extensions, do: ["yml"]
end
