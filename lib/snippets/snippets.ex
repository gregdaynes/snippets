defmodule Snippets.Snippet do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query

  alias Snippets.Repo

  schema "snippets" do
    field :content, :string

    timestamps()
  end

  @permitted_attributes [:content]
  @required_attributes [:content]

  def changeset(snippet, attrs) do
    snippet
    |> cast(attrs, @permitted_attributes)
    |> validate_required(@required_attributes)
  end

  def create_snippet(attrs \\ %{}) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def list_snippets() do
    __MODULE__
    |> newest_first()
    |> Repo.all()
  end

  def change_snippet(%__MODULE__{} = snippet) do
    __MODULE__.changeset(snippet, %{})
  end

  def newest_first(query) do
    from s in query, order_by: [desc: s.inserted_at]
  end
end
