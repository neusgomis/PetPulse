class PostsController < ApplicationController
  def index
    # @pet = Pet.find(params[:pet_id])
    @posts = Post.all
    @pet = Pet.find(params[:pet_id])
  end

  def show
    @pet = Pet.find(params[:pet_id])
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @post = Post.new(post_params)
    @post.pet = @pet
    @post.save
    redirect_to pet_posts_path
  end

  def edit
    @pet = Pet.find(params[:pet_id])
    @post = Post.find(params[:id])
    # @post.pet = @pet
    # redirect_to pet_posts_path
  end

  def update
    # Get the pet record by id
    @post = Post.find(params[:id])
    # If the record is updated with the form params we allowed with private method
    if @post.update(post_params)
      # Redirect to the pet records index page
      redirect_to pet_posts_path, notice: "Successfully updated record."
    else
      # If not saved, render the edit form again
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    @post.destroy
    redirect_to pet_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :pet_id)
  end
end
