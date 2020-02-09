defmodule Snippets.Repo.Migrations.AddSnippetsTable do
  use Ecto.Migration

  def change do
    create table("snippets") do
      add :content, :text

      timestamps()
    end
  end
end
