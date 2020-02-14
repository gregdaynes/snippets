defmodule SnippetsWeb.UserView do
  use SnippetsWeb, :view

  alias Snippets.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
