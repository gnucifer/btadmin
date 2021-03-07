defmodule BtadminWeb.PageController do
  use BtadminWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
