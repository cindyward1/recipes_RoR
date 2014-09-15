class TagsController < ApplicationController

  def new
    @user = RecipeUser.find(session[:current_user_id])
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @user = RecipeUser.find(session[:current_user_id])
    params[:tag_text].downcase!
    @tag = Tag.new(:tag_text => params[:tag_text])
    if @tag.save
      flash[:notice] = "The tag was saved to the database"
      redirect_to("/tags/index")
    else
      render('tags/new.html.erb')
    end
  end

  def index
    @user = RecipeUser.find(session[:current_user_id])
    @tags = Tag.all.order(:tag_text)
    render('tags/index.html.erb')
  end

  def show
    @user = RecipeUser.find(session[:current_user_id])
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes
    render('tags/show.html.erb')
  end

  def edit
    @user = RecipeUser.find(session[:current_user_id])
    @tag = Tag.find(params[:id])
    render('tags/edit.html.erb')
  end

  def update
    @user = RecipeUser.find(session[:current_user_id])
    @tag = Tag.find(params[:id])
    params[:tag_text].downcase!
    if @tag.update(:tag_text => params[:tag_text])
      flash[:notice] = "The tag was updated in the database"
      redirect_to("/tags/index")
    else
      render('tag/edit.html.erb')
    end
  end

  def destroy
    @user = RecipeUser.find(session[:current_user_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "The tag was deleted from the database"
    redirect_to('/tags/index')
  end

end
