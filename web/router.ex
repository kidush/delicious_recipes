defmodule DeliciousRecipes.Router do
  use DeliciousRecipes.Web, :router

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

  scope "/", DeliciousRecipes do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", DeliciousRecipes do
    pipe_through :api
    resources "/recipes", RecipeController, except: [:new, :edit]
  end
end
