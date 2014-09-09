require "date"

class RecipeUsersController < ApplicationController

  def login
    @current_user = nil
    @user = RecipeUser.new
    render('recipe_users/login.html.erb')
  end

  def new
    @user = RecipeUser.new
    render('recipe_users/new.html.erb')
  end

  def create
    @today = Date.today.strftime('%Y-%m-%d')
    params[:recipe_user][:date_joined] = @today
    params[:recipe_user][:user_name].downcase!
    @user = RecipeUser.new(params[:recipe_user])
    if @user.save
      flash[:notice] = "The user was saved to the database"
      redirect_to("/")
    else
      render('recipe_users/new.html.erb')
    end
  end

  def read
    params[:recipe_user][:user_name].downcase!
    @user = RecipeUser.find_by(:user_name => params[:recipe_user][:user_name])
    @current_user = @user
    if @user.nil? || @user.user_password != params[:recipe_user][:user_password]
      flash[:alert] = "User name not found or password didn't match stored value"
      render('recipe_users/login.html.erb')
    else
      flash[:alert] = ""
      render('recipe_users/read.html.erb')
    end
  end

  def list
    @users = RecipeUser.all.order(:user_name)
    render('recipe_users/all.html.erb')
  end

  def edit
    @user = RecipeUser.find(params[:id])
    render('recipe_users/edit.html.erb')
  end

  def update
    @user = RecipeUser.find(params[:id])
    if @user.update(params[:recipe_user])
      flash[:notice] = "The user was updated in the database"
      redirect_to('/recipe_users/all')
    else
      render('recipe_users/edit.html.erb')
    end
  end

  def destroy
    @user = RecipeUser.find(params[:id])
    @user.destroy
    flash[:notice] = "The user was deleted from the database"
    redirect_to('/recipe_users/all')
  end

end
