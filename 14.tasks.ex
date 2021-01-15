# https://hexdocs.pm/elixir/Task.html

# Layer over processes
 Task.async(fn -> do_some_work() end)

# Async
 Process.sleep(5000)
 # async...await
 task = Task.async(fn ->
  Process.sleep(5000)
  :yay
 end)

 Process.alive?(task.pid) # It's just a process!

 Task.await(task) # Get the result

# Real concurrency having parallism
strings = ["long string", "longer string", "there are many of these"]
stream = Task.async_stream(strings, fn text ->
  Process.sleep(3000)
  text |> String.codepoints() |> Enum.count()
end)
Enum.reduce(stream, 0, fn {:ok, num}, acc -> num + acc end)

# Not going into:
# - Supervised tasks https://hexdocs.pm/elixir/Task.html#module-supervised-tasks


