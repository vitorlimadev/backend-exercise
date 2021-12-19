defmodule Benefits.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Benefits.Orders.Order

  @required [:name, :price]

  schema "products" do
    field :name, :string
    field :price, :float
    belongs_to :order, Order

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:name)
  end
end
