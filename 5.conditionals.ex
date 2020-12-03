# https://elixir-lang.org/getting-started/case-cond-and-if.html
case {1, 2, 3} do
  {4, 5, 6} ->
    "This clause won't match"
  {1, x, 3} ->
    "This clause will match and bind x to 2 in this clause"
  _ ->
    "This clause would match any value"
end


# Pin operator
x = 1

case 10 do
  ^x -> "Won't match"
  _ -> "Will match"
end


# Cond
cond do
   2 + 2 == 5 ->
     "This will not be true"
   2 * 2 == 3 ->
     "Nor this"
   1 + 1 == 2 ->
     "But this will"
  true -> "This is always true (equivalent to else)"
end

# If and Unless
if true do
  "This works!"
end

unless true do
  "This will never be seen"
end
