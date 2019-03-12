class VisitorsController < ApplicationController
  def index
  	@posts = Post.all
  	@categories = Category.take(10)
  end
end
