defmodule Todolist.Todo do
  use Ecto.Schema

  schema "todos" do
    field(:description, :string)
    field(:title, :string)

    timestamps()
  end
end
