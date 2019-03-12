class VisitorsController < ApplicationController
  def index
  	search_str = params[:str]
  	if search_str.present?
  		@search_str = search_str
  		@posts = Post.where("title ILIKE ?", "%#{search_str}%").all
  	else
  		@posts = Post.all
  	end
  	@categories = Category.take(10)
  end
end
