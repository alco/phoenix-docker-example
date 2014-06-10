defmodule Webexample.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :webexample
  get "/", Webexample.Controllers.Pages, :index, as: :page
end
