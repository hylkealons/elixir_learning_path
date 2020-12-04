defmodule TodolistWeb.StatusController do
  use TodolistWeb, :controller

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, _params) do
    render(conn, "show.json")
  end
end
