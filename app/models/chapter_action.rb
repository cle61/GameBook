class ChapterAction < ActiveRecord::Base
	has_many :chapter_action

	belongs_to :chapter
end
