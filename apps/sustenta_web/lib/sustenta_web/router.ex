defmodule SustentaWeb.Router do
  use SustentaWeb, :router

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

  scope "/", SustentaWeb do
    pipe_through :browser

    resources "/", PageController, only: [:index, :show]
    scope "/survey" do
      resources "/users", UserController do
        resources "/companies", CompanyController
      end
      resources "/sessions", SessionController, only: [:new, :create, :delete]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", SustentaWeb do
  #   pipe_through :api
  # end
end
