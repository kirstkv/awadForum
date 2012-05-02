class Thread < ActiveRecord::Base
  attr_accessible :name, :lastposterid, :lastpostat
  belongs_to :topic
  has_many :posts, :dependent => :destroy
end
