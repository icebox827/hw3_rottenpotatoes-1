class Movie < ActiveRecord::Base

  scope :order_by_title, :order => "title"
  scope :order_by_created_at, :order => "release_date"
  scope :search_by_rating, lambda{|ratings_table| {:conditions => ["rating in (?)", ratings_table]}}


  def self.all_rating
    all.map(&:rating).uniq
  end

  def self.ratings_search(params)
    ratings_hash = params[:ratings]
    ratings_table = []
    if ratings_hash
      ratings_hash.each do |key, value|
        ratings_table << key if value.to_i == 1
      end
    end
    movies = self
    movies = self.search_by_rating(ratings_table) unless ratings_table.empty?
    movies
  end
end
