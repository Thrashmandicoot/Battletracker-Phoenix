defmodule Battletracker.Router do
  use Battletracker.Web, :router

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

  scope "/", Battletracker do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/characters", CharacterController
    resources "/campaigns", CampaignController
    resources "/encounters", EncounterController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Battletracker do
  #   pipe_through :api
  # end
end
