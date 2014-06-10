defmodule Webexample.Config.Prod do
  use Webexample.Config

  config :router, port: System.get_env("PORT"),
                  # Full error reports are disabled
                  consider_all_requests_local: false

  config :plugs, code_reload: false

  config :logger, level: :error
end


