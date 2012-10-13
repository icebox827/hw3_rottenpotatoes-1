class Movie < ActiveRecord::Base

  scope :order_by_title, :order => "title"
  scope :order_by_created_at, :order => "created_at"
end
