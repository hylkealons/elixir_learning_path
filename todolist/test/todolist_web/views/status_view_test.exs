defmodule TodolistWeb.StatusViewTest do
  use ExUnit.Case

  alias TodolistWeb.StatusView

  describe "render/2" do
    test "show returns the expected response" do
      assert StatusView.render("show.json", %{}) == %{success: true}
    end
  end
end
