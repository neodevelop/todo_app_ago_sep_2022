defmodule TodoApp.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2, where: 2]
  alias TodoApp.Accounts.User

  @derive {Jason.Encoder, only: [:description, :id]}
  schema "tasks" do
    belongs_to :user, User
    field :description, :string
    field :done, :boolean, default: false
    field :expiration, :naive_datetime

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
