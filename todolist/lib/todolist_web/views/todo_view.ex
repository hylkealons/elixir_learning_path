defmodule TodolistWeb.TodoView do
  use TodolistWeb, :view

  @spec render(String.t(), map) :: map
  def render("index.json", _params) do
    [
      %{
        id: "6307da15-af63-4157-8bc4-0fae45816c30",
        title: "advent of code",
        description: "prepare for the advent of code"
      },
      %{
        id: "791d02b3-a0eb-4bbe-8a29-256c3c7c8233",
        title: "prepare elixir code",
        description: "prepare for session 2 of the Elixir Learning Path"
      }
    ]
  end

  @spec render(String.t(), map) :: map
  def render("show.json", _params) do
    %{
      id: "6307da15-af63-4157-8bc4-0fae45816c30",
      title: "advent of code",
      description: "prepare for the advent of code"
    }
  end
end
