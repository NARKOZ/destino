defmodule Destino.Controllers.Main do
  use Sugar.Controller

  def index(conn, args) do
    if length(args) == 0 do
      render conn
    else
      redirect conn, "https://rubygems.org/gems/#{args[:gem]}"
    end
  end
end
