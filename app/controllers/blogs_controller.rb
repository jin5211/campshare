class BlogsController < ApplicationController
  before_action :set_blog, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.includes(:user)
  end

  # GET /blogs/1 or /blogs/1.json
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @blog.comments
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @blog.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content).merge(user_id: current_user.id)
    end

    def contributor_confirmation
      redirect_to root_path unless current_user == @blog.user
    end
end
