defmodule TodolistWeb.StatusControllerTest do
  use TodolistWeb.ConnCase

  describe "show/2" do
    test "returns status json", %{conn: conn} do
      conn = get(conn, Routes.status_path(conn, :show))
      assert json_response(conn, 200) == %{"success" => true}
    end
  end
end
