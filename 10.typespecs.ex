# Typespecs https://hexdocs.pm/elixir/typespecs.html
# Example https://github.com/hylkealons/elixir_learning_path/blob/master/todolist/lib/todolist_web/controllers/status_controller.ex#L4
  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()

# Private types
  @typep something_internal :: map

# Internal types
  @spec show(conn :: Plug.Conn.t(), map) :: Plug.Conn.t()

# Dealing with errors
{:error, {:something, "something went wrong"}}
{:error, "some message"}
{:error, %HttpError.Struct{code: 403, reason: "forbidden"}}

  @spec method(.., ..) :: {:error, term}


# Multiple responses
  @spec method(.., ..) :: :ok | {:error, term}

# Contexts & t
defmodule Todolist.Todo do
  use Ecto.Schema

  alias __MODULE__

  @type t :: %Todo{
    id: pos_integer,
    description: String.t(),
    title: String.t()
  }

  schema "todos" do
    field(:description, :string)
    field(:title, :string)

    timestamps()
  end
end





