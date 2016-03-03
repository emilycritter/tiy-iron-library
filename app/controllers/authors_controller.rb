class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = author.find_by id: params[:id]
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new
    @author.first_name = params[:author][:first_name]
    @author.last_name = params[:author][:last_name]
    @author.bio = params[:author][:bio]

    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end

  def edit
    @author = Author.find_by id: params[:id]
  end

  def update
    @author = Author.new
    @author.first_name = params[:author][:first_name]
    @author.last_name = params[:author][:last_name]
    @author.bio = params[:author][:bio]

    if @author.save
      redirect_to edit_author_path
    else
      render :edit
    end
  end

  def delete
    @author = Author.find_by id: params[:id]
    @author.destroy
    redirect_to authors_path
  end
end
