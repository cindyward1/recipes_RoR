require "date"

class TriedRecipesController < ApplicationController

  def new
    @today = Date.today.strftime('%Y-%m-%d')
    @user = RecipeUser.find(session[:current_user_id])
    @recipe = Recipe.find(params[:recipe_id])
    @tried_recipe = TriedRecipe.new
    render('tried_recipes/new.html.erb')
  end

  def create
    @user = RecipeUser.find(session[:current_user_id])
    @tried_recipe = TriedRecipe.new(:recipe_user_id => @user.id, :date_tried => params[:date_tried], :recipe_id => params[:recipe_id])
    if @tried_recipe.save
      flash[:notice] = "The recipe trial date was saved to the database"
      redirect_to("/tried_recipes")
    else
      render('tried_recipes/new.html.erb')
    end
  end

  def index
    @user = RecipeUser.find(session[:current_user_id])
    @tried_recipes = TriedRecipe.all.order(:recipe_id, :date_tried)
    render('tried_recipes/index.html.erb')
  end

  def edit
    @user = RecipeUser.find(session[:current_user_id])
    @tried_recipe = TriedRecipe.find(params[:id])
    render('tried_recipes/edit.html.erb')
  end

  def update
    @user = RecipeUser.find(session[:current_user_id])
    @tried_recipe = TriedRecipe.find(params[:id])
    if @tried_recipe.update(:date_tried => params[:date_tried])
      flash[:notice] = "The recipe trial date was updated in the database"
      redirect_to("/tried_recipes")
    else
      render('tried_recipes/edit.html.erb')
    end
  end

  def destroy
    @user = RecipeUser.find(session[:current_user_id])
    @tried_recipe = TriedRecipe.find(params[:id])
    @tried_recipe.destroy
    flash[:notice] = "The recipe trial was deleted from the database"
    redirect_to("/tried_recipes")
  end

end
