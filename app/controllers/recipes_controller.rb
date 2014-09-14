require "date"

class RecipesController < ApplicationController

  def new
    @user = RecipeUser.find(session[:current_user_id])
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @today = Date.today.strftime('%Y-%m-%d')
    @user = RecipeUser.find(session[:current_user_id])
    params[:recipe][:date_contributed] = @today
    params[:recipe][:rating] = 0
    params[:recipe][:title].upcase!
    params[:recipe][:recipe_user_id] = @user.id
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "The recipe was saved to the database"
      redirect_to("/recipes/index")
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = RecipeUser.find(session[:current_user_id])
    render('recipes/show.html.erb')
  end

  def index
    @recipes = Recipe.all.order(:title)
    @user = RecipeUser.find(session[:current_user_id])
    render('recipes/index.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = RecipeUser.find(session[:current_user_id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    @user = RecipeUser.find(session[:current_user_id])
    params[:recipe][:title].upcase!
    if @recipe.update(params[:recipe])
      flash[:notice] = "The recipe was updated in the database"
      redirect_to('/recipes/index')
    else
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @user = RecipeUser.find(session[:current_user_id])
    @recipe.destroy
    flash[:notice] = "The recipe was deleted from the database"
    redirect_to('/recipes/index')
  end

end
