class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	self.per_page = 5
end
