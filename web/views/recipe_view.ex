defmodule DeliciousRecipes.RecipeView do
  use DeliciousRecipes.Web, :view

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, DeliciousRecipes.RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, DeliciousRecipes.RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{id: recipe.id,
      title: recipe.title,
      description: recipe.description}
  end
end
