defmodule ErrbitElixir.Api.NoticeView do
  use ErrbitElixir.Web, :view

  def render("show.json", %{ notice: notice }) do
    %{data: render_one(notice, ErrbitElixir.Api.NoticeView, "notice.json")}
  end

  def render("notice.json", %{ notice: notice }) do
    %{id: notice.id}
  end

  def render("error.json", %{ error: error }) do
    %{error: error}
  end
end
