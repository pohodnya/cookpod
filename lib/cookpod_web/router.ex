defmodule CookpodWeb.Router do
  use CookpodWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CookpodWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/terms", PageController, :terms

    resources "/sessions", SessionController, singleton: true
    resources "/users", UserController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CookpodWeb do
  #   pipe_through :api
  # end
end
