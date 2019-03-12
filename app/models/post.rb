class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :comments

	self.per_page = 5
end
