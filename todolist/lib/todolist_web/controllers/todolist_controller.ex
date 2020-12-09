defmodule TodolistWeb.TodoController do
  use TodolistWeb, :controller

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.json")
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, _params) do
    render(conn, "show.json")
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, _params) do
    conn |> put_status(:created) |> render("show.json")
  end

  @spec update(Plug.Conn.t(), map) :: Plug.Conn.t()
  def update(conn, _params) do
    render(conn, "show.json")
  end

  @spec delete(Plug.Conn.t(), map) :: Plug.Conn.t()
  def delete(conn, _params) do
    send_resp(conn, 204, "")
  end
end
