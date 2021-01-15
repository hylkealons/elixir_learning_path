# https://elixir-lang.org/getting-started/processes.html

# 1. Spawing a process
# pid = process id
  pid = spawn(fn -> IO.puts("hello world!") end)

  # https://hexdocs.pm/elixir/Process.html#alive?/1
  Process.alive?(process)

# 2. The base of messaging
  # self() is pointing to the current pid
  send(self(), :test_message)
  send(self(), "test_message")


# 3. Receiving messages
  messages = :erlang.process_info(self(), :messages)
  # (And they will continue to be there)
  # Number of messages
  :erlang.process_info(self(), :message_queue_len)

  flush()

  receive do
    message -> "received message from queue: #{inspect(message)}"
  after
    1_000 -> "nothing after 1000ms"
  end


# 4. Sending message to other pid + pattern matching
terminal_pid = self()
spawn fn -> send(terminal_pid, {:something_happened, "process_pid #{self()}"}) end
spawn fn -> send(terminal_pid, :error) end

receive do
  {:something_happened, "message"} -> "received message from queue: #{inspect(message)}"
  :error -> "Something went wrong"
end
