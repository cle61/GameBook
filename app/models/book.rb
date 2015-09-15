class Book < ActiveRecord::Base
	has_many :chapter

	belongs_to :user
end
