class Topic < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :threads, :dependent => :destroy
end
