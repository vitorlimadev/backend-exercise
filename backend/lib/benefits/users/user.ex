defmodule Benefits.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:username, :balance]

  schema "users" do
    field :username, :string
    field :balance, :float

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:username)
  end
end
