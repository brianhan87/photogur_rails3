class Picture < ActiveRecord::Base
	attr_accessible :artist, :title, :url
	has_many :comments
end
