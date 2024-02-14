class PostsController < ApplicationController
  def index
    # @pet = Pet.find(params[:pet_id])
    @pet = Pet.find(params[:pet_id])
    @posts = @pet.posts
    @post = Post.new

    if params[:query].present?
      sql_subquery = "title ILIKE :query OR content ILIKE :query"
      @posts = @posts.where(sql_subquery, query: "%#{params[:query]}%")
    end
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
    if params[:post][:images].present?
      @post.images.attach(params[:post][:images])
    end
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
    if params[:post][:images].present?
      @post.images.attach(params[:post][:images])
    end
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
    params.require(:post).permit(:title, :content, :pet_id, files: [])
  end
end
