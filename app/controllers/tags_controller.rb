class TagsController < ApplicationController

  def new
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(:tag_text => params[:tag_text])
    if @tag.save
      flash[:notice] = "The tag was saved to the database"
      redirect_to("/tags")
    else
      render('tags/new.html.erb')
    end
  end

  def list
    @tags = Tag.all.order(:tag_text)
    render('tags/all.html.erb')
  end

  def edit
    @tag = Tag.find(params[:id])
    render('tags/edit.html.erb')
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(:tag_text => params[:tag_text])
      flash[:notice] = "The tag was updated in the database"
      redirect_to("/tags")
    else
      render('tag/edit.html.erb')
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "The tag was deleted from the database"
    redirect_to('/tags')
  end

end
