class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]

  # GET /posts
  def index
    if current_user.admin?
      @posts = Post.paginate(:page => params[:page])
    else
      @posts = Post.where(:user_id => current_user.id).paginate(:page => params[:page])
    end
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @categories = Category.all
    @users = User.all
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @categories = Category.all
    @users = User.all
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end
end
