defmodule ErrbitElixir.AppController do
  use ErrbitElixir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, _) do
    changeset = ErrbitElixir.App.changeset(%ErrbitElixir.App{})
    render conn, changeset: changeset
  end

  def create(conn, %{"app" => app_params}) do
    changeset = ErrbitElixir.App.changeset(%ErrbitElixir.App{}, app_params)

    if changeset.valid? do
      Repo.insert(changeset)
      conn
      |> put_flash(:info, "App has been successfully created.")
      |> redirect(to: app_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end
end
