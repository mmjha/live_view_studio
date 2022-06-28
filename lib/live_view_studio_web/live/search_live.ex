defmodule LiveViewStudioWeb.Live.SearchLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Stores

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
