## Pipes!
foo(bar(baz(new_function(other_function()))))

other_function() |> new_function() |> baz() |> bar() |> foo()

"Elixir rocks" |> String.upcase() |> String.split()
["ELIXIR", "ROCKS"]

# With
## Example: https://github.com/digitalorigin/pg-elixir-tools/blob/master/lib/events/event.ex#L67
## Example 2: https://github.com/digitalorigin/pg-elixir-tools/blob/master/lib/events/event.ex#L131
## Explained https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html#with

def do_http_request() do
end

def do_something_else_that_can_fail(http_response) do
end


with {:ok, http_response} <- do_http_request(),
      :ok <- do_something_else_that_can_fail(http_response) do
  {:ok, :everything_succeeded}
end


