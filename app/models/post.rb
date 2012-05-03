class Post < ActiveRecord::Base
  attr_accessible :content
  belongs_to :thred
end
