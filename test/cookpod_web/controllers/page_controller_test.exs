defmodule CookpodWeb.PageControllerTest do
  use CookpodWeb.ConnCase
  import Plug.Test

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /terms", %{conn: conn} do
    conn = conn
      |> init_test_session(%{current_user: "test-user"})
      |> get("/terms")
    assert html_response(conn, 200) =~ "Lorem ipsum"
  end
end
