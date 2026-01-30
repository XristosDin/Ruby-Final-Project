class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @categories = Category.all
    @posts = params[:category_id].present? ?
               Post.where(category_id: params[:category_id]) :
               Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Το post δημιουργήθηκε"
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
