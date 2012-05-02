class Post < ActiveRecord::Base
  attr_accessible :content
  belongs_to :thread
end
