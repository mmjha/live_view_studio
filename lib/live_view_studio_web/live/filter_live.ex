defmodule LiveViewStudioWeb.FilterLive do
  use LiveViewStudioWeb, :live_view

  # alias LiveViewStudio.Filters
  alias LiveViewStudio.Boats


  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        boats: Boats.list_boats(),
        type: "",
        prices: []
      )
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Daily Boat Rentals</h1>

    <div id="filter">
      <form phx-change="filter">
        <div class="filters">
          <select name="type">
            <%= options_for_select(type_options(), @type) %>
          </select>
          <div class="prices">
            <input type="hidden" name="prices[]" value="" />
            <%= for price <- ["$", "$$", "$$$"] do %>
              <%= price_checkbox(%{price: price, checked: price in @prices}) %>
            <% end %>
          </div>
        </div>
      </form>
      <div class="boats">
        <%= for boat <- @boats do %>
          <div class="card">
            <img src="<%= boat.image %>">
            <div class="content">
              <div class="model">
                <%= boat.model %>
              </div>
              <div class="details">
                <span class="price">
                  <%= boat.price %>
                </span>
                <span class="type">
                  <%= boat.type %>
                </span>
              </div>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp type_options do
    [
      "All Types": "",
      Fishing: "fishing",
      Sporting: "sporting",
      Sailing: "sailing"
    ]
  end

  defp price_checkbox(assigns) do
    ~L"""
    <input type="checkbox" id="<%= @price %>"
           name="prices[]" value="<%= @price %>"
           <%= if @checked, do: "checked" %> />
    <label for="<%= @price %>"><%= @price %></label>
    """
  end

  def handle_event("filter", %{"type" => type, "prices" => prices}, socket) do
    params = [type: type, prices: prices]
    boats = Boats.list_boats(type: type)
    socket = assign(socket, params ++ [boats: boats])
    {:noreply, socket}
  end

  # def handle_event("type-filter", %{"type" => type}, socket) do
  #   send(self(), {:run_type_filter, type})

  #   socket =
  #     assign(socket,
  #       type: type,
  #       stores: [],
  #       loading: true
  #     )

  #   {:noreply, socket}
  # end

  # def handle_info({:run_type_filter, type}, socket) do
  #   case Filters.select_by_type(type) do
  #     [] ->
  #       socket =
  #         socket
  #         |> put_flash(:info, "No stores matching \"#{type}\"")
  #         |> assign(stores: [], loading: false)

  #       {:noreply, socket}

  #     stores ->
  #       socket = assign(socket, stores: stores, loading: false)
  #       {:noreply, socket}
  #   end
  # end
end
