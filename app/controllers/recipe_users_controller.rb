require "date"

class RecipeUsersController < ApplicationController

  def login
    session[:current_user_id] = nil
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
    @user.check_screen_name
    if @user.save
      flash[:notice] = "The user was saved to the database"
      redirect_to("/")
    else
      render('recipe_users/new.html.erb')
    end
  end

  def show
    if session[:current_user_id].nil? && !params[:recipe_user].nil?
      params[:recipe_user][:user_name].downcase!
      @user = RecipeUser.find_by(:user_name => params[:recipe_user][:user_name])
      if @user.nil? || @user.user_password != params[:recipe_user][:user_password]
        flash[:alert] = "User name not found or password didn't match stored value"
        render('recipe_users/login.html.erb')
      else
        flash[:alert] = ""
        session[:current_user_id] = @user.id
        render('recipe_users/show.html.erb')
      end
    elsif session[:current_user_id].nil?
      flash[:alert] = "Please login before going to the Welcome User menu"
      redirect_to("/")
    else
      @user = RecipeUser.find(session[:current_user_id])
      render('recipe_users/show.html.erb')
    end
  end

  def index
    @users = RecipeUser.all.order(:user_name)
    render('recipe_users/index.html.erb')
  end

  def edit
    @user = RecipeUser.find(params[:id])
    current_user_id = session[:current_user_id]
    if @user.id != current_user_id
      flash[:alert] = "You may edit only your own user information"
      redirect_to('/recipe_users/index')
    else
      flash[:alert] = ""
      render('recipe_users/edit.html.erb')
    end
  end

  def update
    @user = RecipeUser.find(params[:id])
    if params[:recipe_user][:screen_name] == ""
      params[:recipe_user][:screen_name] = @user.user_name
    end
    if @user.update(params[:recipe_user])
      flash[:notice] = "The user was updated in the database"
      redirect_to('/recipe_users/index')
    else
      render('recipe_users/edit.html.erb')
    end
  end

  def destroy
    @user = RecipeUser.find(params[:id])
    @user.destroy
    session[:current_user_id] = nil
    flash[:notice] = "The user was logged off and deleted from the database"
    redirect_to('/recipe_users/index')
  end

end
