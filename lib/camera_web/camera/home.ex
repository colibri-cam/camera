defmodule CameraWeb.Camera.Home do
  use CameraWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :message, "Hello, welcome to camera app")}
  end

  def render(assigns) do
    ~H"""
    <div class="p-6">
      <h1 class="text-2xl font-bold">Camera app</h1>
      <p><%= @message %></p>
      <button phx-click="change_message" class="btn">Click me</button>
    </div>
    """
  end

  def handle_event("change_message", _params, socket) do
    {:noreply, assign(socket, :message, "You clicked the button!")}
  end
end
