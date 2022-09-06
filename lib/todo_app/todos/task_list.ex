defmodule TodoApp.Todos.TaskList do
  use Ecto.Schema

  alias TodoApp.Todos.List
  alias TodoApp.Todos.Task

  schema "tasks_lists" do
    belongs_to :task, Task
    belongs_to :list, List
    timestamps()
  end
end
