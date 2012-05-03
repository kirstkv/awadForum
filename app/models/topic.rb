class Topic < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :threds, :dependent => :destroy
end
