class Post < ActiveRecord::Base
  attr_accessible :contacts, :fdate, :fplace, :info, :pet_name, :photo, :status

  validates_presence_of :contacts, :fdate, :fplace, :info, :pet_name, :photo

  has_one :user
end
