defmodule SnippetsWeb.Router do
  use SnippetsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SnippetsWeb.Auth
  end

  scope "/", SnippetsWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/snippets", SnippetController, only: [:index, :new, :create]
    resources "/users", UserController, only: [:index, :show, :create, :new]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
end
