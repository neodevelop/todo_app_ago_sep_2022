defmodule TodoApp.Todos.List do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoApp.Accounts.User
  alias TodoApp.Todos.TaskList

  schema "lists" do
    field :name, :string
    field :tags, {:array, :string}
    belongs_to :user, User

    has_many :collaborators, User

    many_to_many :tasks, TodoApp.Todos.Task, join_through: TaskList

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :tags])
    |> validate_required([:name, :tags])
  end
end
