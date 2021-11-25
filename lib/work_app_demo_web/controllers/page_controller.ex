defmodule WorkAppDemoWeb.PageController do
  use WorkAppDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
