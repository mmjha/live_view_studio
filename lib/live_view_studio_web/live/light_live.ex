defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    IO.puts "MOUNT #{inspect(self())}"
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def handle_event("on", _, socket) do
    IO.puts "RENDER #{inspect(self())}"
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    # brightness = socket.assigns.brightness - 10
    # socket = assign(socket, :brightness, brightness)
    # socket = update(socket, :brightness, fn b -> b - 10 end)
    # socket = update(socket, :brightness, &(&1 - 10))
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    # brightness = socket.assigns.brightness + 10
    # socket = assign(socket, :brigtness, brightness)
    # socket = update(socket, :brightness, fn b -> b + 10 end)
    # socket = update(socket, :brightness, &(&1 + 10))
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Front Porch Light</h1>
      <div id="light">
        <div class="meter">
          <span style="width: <%= @brightness %>%">
            <%= @brightness %>%
          </span>
        </div>
      </div>

      <button phx-click="off">
        Off
      </button>

      <button phx-click="on">
        On
      </button>

      <button phx-click="down">
        Down
      </button>

      <button phx-click="up">
        Up
      </button>
    """
  end
end
