# Installing Ecto

1. Database up and running
(Using docker-compose.yml, or local)

1. Install a package to mix.exs
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}

    ```bash
    mix deps.get
    ```

1. Configure

    ```elixir
    # Defining your repo
    # todolist/lib/todolist/repo.ex
    defmodule Todolist.Repo do
      use Ecto.Repo, otp_app: :todolist, adapter: Ecto.Adapters.Postgres
    end


    # Ensure it gets started in the supervision tree (explained in session 3)
    # todolist/lib/todolist/application.ex
    def start(_type, _args) do
      children = [
        #...,
        Todolist.Repo,
      ]

    # In your config/config.exs file
    config :todolist, ecto_repos: [Todolist.Repo]

    config :todolist, Todolist.Repo,
      database: "db",
      username: "root",
      password: "root",
      hostname: "localhost",
      port: "5432"
    ```

1. Provision the database # https://hexdocs.pm/ecto_sql/Ecto.Migration.html

    ```bash
    mix deps.get

    mix ecto.gen.migration add_todolist
    ```

    ```elixir
      create table("todos") do
        add :title, :integer
        add :description, :integer

        timestamps()
      end
    ```

1. Add the domain context https://hexdocs.pm/ecto/Ecto.Schema.html

    ```elixir
    # lib/todolist/todo/todo.ex
      defmodule Todolist.Todo do
      use Ecto.Schema

      schema "todos" do
        field(:description, :string)
        field(:title, :string)

        timestamps()
      end
    end

    ```

1. Useful commands

    https://hexdocs.pm/ecto/Ecto.Repo.html#content

    ```elixir
    Todolist.Repo.all(Todolist.Todo.Todo)
    item = Todolist.Repo.insert!(%Todolist.Todo{title: "test", description: "yay"})
    item = Todolist.Repo.get!(Todolist.Todo, item.id) # https://hexdocs.pm/ecto/Ecto.Repo.html#c:get/3
    item = Todolist.Repo.update!(%{item | title: "New title"}) # BOOM!
    changeset = Ecto.Changeset.change(item, title: "New title")
    item = Todolist.Repo.update!(changeset)
    item = Todolist.Repo.delete!(item)
    ```

1. Remember

    - All interactions happen on a Repo
    - All data is a struct
    - Changes are changesets
    - Accessing an entity is done by the Schema

1. Querying

    ```elixir
      query =
          from(m in module,
            where: field(m, ^field) == ^value,
            order_by: [desc: m.inserted_at],
            limit: 1
          )

        Todolist.Repo.one(query)
    ```

1. **Build the todo list context and connect it to the API**
