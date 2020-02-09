defmodule SnippetsWeb.SnippetController do
  use SnippetsWeb, :controller

  alias Snippets.Snippet

  def index(conn, _params) do
    snippets = Snippet.list_snippets()
    changeset = Snippet.change_snippet(%Snippet{})
    render(conn, "index.html", snippets: snippets, changeset: changeset)
  end

  def create(conn, %{"snippet" => snippet_params}) do
    snippets = Snippet.list_snippets()

    case Snippet.create_snippet(snippet_params) do
      {:ok, _snippet} ->
        conn
        |> put_flash(:info, "Snippet created successfully.")
        |> redirect(to: Routes.snippet_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset, snippets: snippets)
    end
  end
end
