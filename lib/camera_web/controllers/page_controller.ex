defmodule CameraWeb.PageController do
  use CameraWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
