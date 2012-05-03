class Topic < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :threds, :dependent => :destroy
  
  def most_recent_post  
    thred= Thred.first(:order => 'last_post_at DESC', :conditions => ['topic_id = ?', self.id])  
    return thred 
  end  
end
