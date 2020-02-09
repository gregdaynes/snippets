defmodule SnippetsWeb.PageController do
  use SnippetsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
