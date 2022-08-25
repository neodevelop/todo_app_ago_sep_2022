defmodule TodoApp.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:description, :id]}
  schema "tasks" do
    field :description, :string
    field :done, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:description, :done])
    |> validate_required([:description, :done])
    |> validate_length(:description, min: 5)
  end
end
