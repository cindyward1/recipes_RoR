require "date"

class RecipesController < ApplicationController

  def new
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    @recipe = Recipe.new
    @tag_id_array = @recipe.get_tags
    render('recipes/new.html.erb')
  end

  def create
    @today = Date.today.strftime('%Y-%m-%d')
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    params[:recipe][:date_contributed] = @today
    params[:recipe][:rating] = 0
    params[:recipe][:number_ratings] = 0
    params[:recipe][:title].upcase!
    params[:recipe][:recipe_user_id] = @user.id
    @recipe = Recipe.new(params[:recipe])
    @tag = Tag.where(params[:tag])
    @recipe.tags << @tag
    if @recipe.save
      flash[:notice] = "The recipe was saved to the database"
      redirect_to("/recipes/index")
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    @recipe = Recipe.find(params[:id])
    @tag_id_array = @recipe.get_tags
    render('recipes/show.html.erb')
  end

  def index
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    @recipes = Recipe.all.order(rating: :desc, title: :asc)
    render('recipes/index.html.erb')
  end

  def edit
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    @recipe = Recipe.find(params[:id])
    @tag_id_array = @recipe.get_tags
    render('recipes/edit.html.erb')
  end

  def update
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    @recipe = Recipe.find(params[:id])
    if @user.type == "Contributor"
      if !params[:recipe][:title].nil?
        params[:recipe][:title].upcase!
      end
      @tag = Tag.where(params[:tag])
      @recipe.tags.destroy_all
      @recipe.tags << @tag
    else
      if !params[:recipe][:rating].nil?
        new_rating = params[:recipe][:rating].to_i
        params[:recipe][:rating] = @recipe.calculate_rating(new_rating)
        params[:recipe][:number_ratings] = @recipe.number_ratings + 1
      end
    end
    if @recipe.update(params[:recipe])
      flash[:notice] = "The recipe was updated in the database"
      redirect_to('/recipes/index')
    else
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @user = RecipeUser.find(session[:current_user_id])
    @recipe = Recipe.find(params[:id])
    @recipe.tags.destroy_all
    @recipe.destroy
    flash[:notice] = "The recipe was deleted from the database"
    redirect_to('/recipes/index')
  end

end
