defmodule TodoApp.Todos.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :name, :string
    field :tags, {:array, :string}
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :tags])
    |> validate_required([:name, :tags])
  end
end
