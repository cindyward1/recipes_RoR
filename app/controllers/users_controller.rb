require "date"

class UsersController < ApplicationController

  def login
    @current_user = nil
    @user = User.new
    render('users/login.html.erb')
  end

  def new
    @user = User.new
    render('users/new.html.erb')
  end

  def create
    @today = Date.today.strftime('%Y-%m-%d')
    params[:user][:date_joined] = @today
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "The user was saved to the database"
      redirect_to("/")
    else
      render('users/new.html.erb')
    end
  end

  def read
    @user = User.find_by(:user_name => params[:user][:user_name])
    @current_user = @user
    if @user.nil? || @user.user_password != params[:user][:user_password]
      flash[:alert] = "User name not found or password didn't match stored value"
      render('login.html.erb')
    else
      flash[:alert] = ""
      render('read.html.erb')
    end
  end

  def list
    @users = User.all.order(:screen_name)
    render('users/all.html.erb')
  end

  def edit
    @user = User.find(params[:id])
    render('users/edit.html.erb')
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user])
      flash[:notice] = "The user was updated in the database"
      redirect_to('/users/all')
    else
      render('users/edit.html.erb')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "The user was deleted from the database"
    redirect_to('/users/all')
  end

end
