class PostsController < ApplicationController
  def index
    # @pet = Pet.find(params[:pet_id])
    @posts = Post.all
    @pet = Pet.find(params[:pet_id])
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
    @post.pet = @pet
    redirect_to pet_posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to pet_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :pet_id)
  end
end
