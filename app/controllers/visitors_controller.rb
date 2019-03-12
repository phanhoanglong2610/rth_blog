class VisitorsController < ApplicationController
  def index
  	search_str = params[:str]
    view_mode = params[:view]
  	if search_str.present?
  		@search_str = search_str
  		@posts = Post.where("title ILIKE ?", "%#{search_str}%").all
  	elsif view_mode.present? && view_mode == "latest"
      @posts = Post.order("created_at DESC")
    else
  		@posts = Post.take(10)
  	end
  	@categories = Category.take(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @categories = Category.take(10)
  end
end
