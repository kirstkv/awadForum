class Thred < ActiveRecord::Base
  attr_accessible :name, :lastposterid, :lastpostat, :topic_id
  has_many :posts
  belongs_to :user
end
