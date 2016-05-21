defmodule DeliciousRecipes.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :recipe_id, references(:recipes)

      timestamps
    end
    create index(:items, [:recipe_id])

  end
end
