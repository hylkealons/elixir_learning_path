defmodule TodolistWeb.TodoListControllerTest do
  use TodolistWeb.ConnCase

  describe "show/2" do
    test "returns the todolist json", %{conn: conn} do
      conn = get(conn, Routes.todo_path(conn, :show, "test_id"))

      assert json_response(conn, 200) == %{
               "description" => "prepare for the advent of code",
               "id" => "6307da15-af63-4157-8bc4-0fae45816c30",
               "title" => "advent of code"
             }
    end
  end

  describe "index/2" do
    test "returns the todolists json", %{conn: conn} do
      conn = get(conn, Routes.todo_path(conn, :index))

      assert json_response(conn, 200) == [
               %{
                 "description" => "prepare for the advent of code",
                 "id" => "6307da15-af63-4157-8bc4-0fae45816c30",
                 "title" => "advent of code"
               },
               %{
                 "description" => "prepare for session 2 of the Elixir Learning Path",
                 "id" => "791d02b3-a0eb-4bbe-8a29-256c3c7c8233",
                 "title" => "prepare elixir code"
               }
             ]
    end
  end

  describe "update/2" do
    test "returns the expected response", %{conn: conn} do
      todo = %{
        "description" => "prepare for the advent of code",
        "id" => "6307da15-af63-4157-8bc4-0fae45816c30",
        "title" => "advent of code"
      }

      conn = put(conn, Routes.todo_path(conn, :update, "test_id"), todo)

      assert json_response(conn, 200) == %{
               "description" => "prepare for the advent of code",
               "id" => "6307da15-af63-4157-8bc4-0fae45816c30",
               "title" => "advent of code"
             }
    end
  end

  describe "create/2" do
    test "returns the expected response", %{conn: conn} do
      todo = %{
        "description" => "prepare for the advent of code",
        "id" => "6307da15-af63-4157-8bc4-0fae45816c30",
        "title" => "advent of code"
      }

      conn = post(conn, Routes.todo_path(conn, :create), todo)

      assert json_response(conn, 201) == %{
               "description" => "prepare for the advent of code",
               "id" => "6307da15-af63-4157-8bc4-0fae45816c30",
               "title" => "advent of code"
             }
    end
  end

  describe "delete/2" do
    test "returns the expected response", %{conn: conn} do
      conn = delete(conn, Routes.todo_path(conn, :delete, "test_id"))

      assert conn.status == 204
      assert conn.resp_body == ""
    end
  end
end
