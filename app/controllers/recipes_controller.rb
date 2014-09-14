class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    render('Recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "The recipe was saved to the database"
      redirect_to("/recipes/#{@recipe.id}/show")
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find_by(:title => params[:title])
    render('recipes/read.html.erb')
  end

  def edit
    @recipe = Recipe.find_by(:title => params[:title])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find_by(:title => params[:title])
    if @recipe.update(params[:recipe])
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
