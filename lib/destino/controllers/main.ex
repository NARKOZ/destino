defmodule Destino.Controllers.Main do
  use Sugar.Controller

  def index(conn, []) do
    raw conn |> resp(200, "Hello world")
  end
end
