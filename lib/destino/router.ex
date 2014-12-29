defmodule Router do
  use Sugar.Router
  plug Sugar.Plugs.HotCodeReload

  if Sugar.Config.get(:sugar, :show_debugger, false) do
    plug Plug.Debugger, otp_app: :destino
  end

  plug Plug.Static, at: "/static", from: :destino

  # Uncomment the following line for session store
  # plug Plug.Session, store: :ets, key: "sid", secure: true, table: :session

  # Define your routes here
  get "/", Destino.Controllers.Main, :index
  get "/:gem", Destino.Controllers.Main, :index
end
