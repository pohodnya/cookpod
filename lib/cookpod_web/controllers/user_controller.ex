defmodule CookpodWeb.UserController do
  use CookpodWeb, :controller

  alias Cookpod.User
  alias Cookpod.Repo

  def new(conn, _params) do
    changeset = User.new_changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => attrs}) do
    changeset = User.changeset(%User{}, attrs)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> redirect(to: Routes.page_path(conn, :terms))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end