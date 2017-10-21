defmodule ErrbitElixir.NoticeController do
  use ErrbitElixir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
