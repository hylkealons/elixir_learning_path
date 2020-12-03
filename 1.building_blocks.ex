# Floats
2.22

# Numbers
2

# Lists https://hexdocs.pm/elixir/List.html#content
[1, 2, 3, 4]

# Map https://hexdocs.pm/elixir/Map.html#content
%{a: "b"}

# Keyword https://hexdocs.pm/elixir/Keyword.html
[a: "b"]

# Strings & Concat https://hexdocs.pm/elixir/String.html
"string"
"str" <> "ing"

var = "ing"
"str#{var}"

# (char) list -> https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html
is_binary("string")
is_binary('string')

# A charlist is a list of integers where all the integers are valid code points.
is_list('string')

# Tuple https://hexdocs.pm/elixir/Tuple.html#content
{}

# Atoms https://hexdocs.pm/elixir/Atom.html#content'
:atom ## DOES NOT GET GARBAGECOLLECTED and has by default a 1048576

# Fun fact! using erlang in Elixir
## https://elixir-lang.org/getting-started/erlang-libraries.html
