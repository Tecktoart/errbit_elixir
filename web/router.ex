defmodule ErrbitElixir.Router do
  use ErrbitElixir.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :with_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug ErrbitElixir.CurrentUser
  end

  pipeline :login_required do
    plug Guardian.Plug.EnsureAuthenticated, handler: ErrbitElixir.GuardianErrorHandler
  end

  # Guest zone
  scope "/", ErrbitElixir do
    pipe_through [:browser, :with_session]

    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    # Registered user zone
    scope "/" do
      pipe_through [:login_required]

      get "/", HomeController, :index
      resources "/apps", AppController
      resources "/users", UserController, only: [:index, :show]
      resources "/notices", NoticeController, only: [:index, :show, :delete]
    end
  end

   scope "/api", ErrbitElixir do
     pipe_through :api

     resources "/notices", Api.NoticeController, only: [:create]
   end
end
