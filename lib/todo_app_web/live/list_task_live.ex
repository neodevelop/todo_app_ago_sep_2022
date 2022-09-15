defmodule TodoAppWeb.ListTaskLive do
  use TodoAppWeb, :live_view

  alias TodoApp.Todos.List
  alias TodoApp.Todos.Task
  alias TodoApp.Todos

  def mount(_params, _session, socket) do
    changeset = Todos.change_list(%List{})
    socket = socket |> assign(changeset: changeset, tasks: [])
    {:ok, socket}
  end

  def handle_event("add_task", _parans, socket) do
    socket =
      socket
      |> assign(:tasks, [%Task{} | socket.assigns.tasks])

    {:noreply, socket}
  end

  def handle_event("validate_task" <> index, _params, socket) do
    IO.inspect(binding())
    {:noreply, socket}
  end

  def handle_event("validate", %{"list" => list_params}, socket) do
    changeset =
      %List{}
      |> Todos.change_list(Map.put(list_params, "user_id", 1))
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"list" => list_params}, socket) do
    list_params
    |> Map.put("tasks", socket.assigns.tasks)
    |> Todos.create_list()
    |> case do
      {:ok, list} ->
        socket
        |> put_flash(:info, "A list has been created")
        |> redirect(to: Routes.list_path(socket, :show, list))

        {:noreply, socket}

      {:error, changeset} ->
        {:error, assign(socket, :changeset, changeset)}
    end

    {:noreply, socket}
  end
end
