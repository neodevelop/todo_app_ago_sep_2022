defmodule TodoAppWeb.SimpleLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <h1>Hello world!!!</h1>
    <input type="text" name="input" phx-keydown="capture">
    <label for="text">Result:</label>
    <h3></h3>
    """
  end

  def handle_event("capture", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end
end
