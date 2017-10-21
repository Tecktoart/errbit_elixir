require IEx
import Ecto.Queryable

defmodule ErrbitElixir.Api.NoticeController do
  use ErrbitElixir.Web, :controller

  alias ErrbitElixir.Notice
  alias ErrbitElixir.App

  plug :check_api_key when action in [:create]

  def create(conn, %{"notice" => notice_params}) do
    changeset = Notice.changeset(%Notice{}, notice_params)

    case Repo.insert(changeset) do
      {:ok, notice} ->
        conn
        |> put_status(:created)
        |> render("show.json", notice: notice)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ErrbitElixir.ChangesetView, "error.json", changeset: changeset)
    end
  end

  defp check_api_key(conn, params) do
    app = Repo.get_by(App, api_key: conn.params["api_key"])

    case app do
      nil -> render("error.json", error: "Api key is not present")
    end
  end
end
