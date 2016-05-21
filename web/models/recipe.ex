defmodule DeliciousRecipes.Recipe do
  use DeliciousRecipes.Web, :model

  schema "recipes" do
    field :title, :string
    field :description, :string
    has_many :items, DeliciousRecipes.Item

    timestamps
  end

  @required_fields ~w(title description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
