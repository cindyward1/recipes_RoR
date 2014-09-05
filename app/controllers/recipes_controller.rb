class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
    @instruction = Instruction.new
    render('Recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    params[:ingredients].each.do |ingredient_param|
      @ingredient = Ingredient.find_or_create_by(ingredient_param[:ingredient_info])
      @ingredients_recipe = IngredientsRecipe.new(:recipe_id => @recipe.id,
                                                  :ingredient_id => @ingredient.id
                                                  :quantity => ingredient_param[:quantity])
      @ingredients_recipe.save
    end
    params[:instructions].each.do |instruction_param|
      @instruction = Instruction.create(instructions_param)
    end
    if @recipe.save
      flash[:notice] = "The recipe was saved to the database"
      redirect_to("/recipes/#{@recipe.id}/show")
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find_by(:title => params[:title])
    @ingredients_recipes = IngredientsRecipe.find_by(:recipe_id => @recipe.id)
    @ingredients = IngredientsRecipe.get_ingredients
    @instructions = Instructions.find_by(:recipe_id => @recipe.id)
    render('recipes/read.html.erb')
  end

  def edit
    @recipe = Recipe.find_by(:title => params[:title])
    @ingredients_recipes = IngredientsRecipe.find_by(:recipe_id => @recipe.id)
    @ingredients =
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find_by(:title => params[:title])
    if @recipe.update_everything(params[:recipe])
      flash[:notice] = "The recipe was updated in the database"
      redirect_to("/recipes/#{@recipe.id}/show")
    else
      render('recipe/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find_by(:title => params[:title])
    @recipe.destroy
    flash[:notice] = "The recipe was deleted from the database"
    redirect_to('/recipes/all')
  end

end
