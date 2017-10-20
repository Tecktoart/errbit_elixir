require IEx

defmodule ErrbitElixir.AppController do
  use ErrbitElixir.Web, :controller
  alias ErrbitElixir.App

  def index(conn, _params) do
    apps = Repo.all(App)
    render conn, "index.html", apps: apps
  end

  def new(conn, _) do
    changeset = App.changeset(%App{})
    render conn, changeset: changeset
  end

  def create(conn, %{"app" => app_params}) do
    changeset = App.changeset(%App{}, app_params)

    if changeset.valid? do
      Repo.insert(changeset)
      conn
      |> put_flash(:info, "App has been successfully created.")
      |> redirect(to: app_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    app = Repo.get(App, id)
    changeset = App.changeset(app)

    render conn, changeset: changeset, app: app
  end

  def update(conn, %{"id" => id, "app" => app_params}) do
    app = Repo.get(App, id)
    changeset = App.changeset(app, app_params)

    if changeset.valid? do
      Repo.update(changeset)
      conn
      |> put_flash(:info, "App has been successfully updated.")
      |> redirect(to: app_path(conn, :index))
    else
      render(conn, "edit.html", changeset: changeset, app: app)
    end
  end

  def destroy(conn, %{"id" => id}) do
    app = Repo.get(App, id)

    Repo.delete(app)
    conn
    |> put_flash(:info, "App has been successfully destroyed.")
    |> redirect(to: app_path(conn, :index))
  end
end
