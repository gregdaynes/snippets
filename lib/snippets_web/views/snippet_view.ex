defmodule SnippetsWeb.SnippetView do
  use SnippetsWeb, :view

  import Earmark

  def to_html(content) do
    Earmark.as_html!(content)
    |> raw
  end

  def to_date(content) do
    {:ok, datetime} = content
    |> DateTime.from_naive!("Etc/UTC")
    |> DateTime.shift_zone("America/Vancouver")

    DateTime.to_date(datetime)
  end
end
