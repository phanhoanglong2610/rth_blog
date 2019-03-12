class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]

  # GET /comments
  def index
    if current_user.admin?
      @comments = Comment.paginate(:page => params[:page])
    else
      @comments = Comment.where(:user_id => current_user.id).paginate(:page => params[:page])
    end
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @posts = Post.all
    @users = User.all
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @posts = Post.all
    @users = User.all
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      if params[:from].present?
        redirect_to visitor_path(comment_params['post_id']), notice: 'Comment was successfully created.'
      else
        redirect_to @comment, notice: 'Comment was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end
end
