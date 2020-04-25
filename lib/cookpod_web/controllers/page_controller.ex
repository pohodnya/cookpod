defmodule CookpodWeb.PageController do
  use CookpodWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def terms(conn, _params) do
    if get_session(conn, :current_user), do: render(conn, "terms.html"), else: redirect(conn, to: Routes.session_path(conn, :new))
  end
end
