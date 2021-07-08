
class Show < ActiveRecord::Base

	def self.highest_rating
		Show.maximum(:rating)
	end
	
	def self.most_popular_show
		# show = Show.all.select {|show| show.rating == Show.highest_rating}
		# show[0] OR show.first
		Show.where("rating = ?", Show.highest_rating).first
	end

	def self.lowest_rating
		Show.minimum(:rating)
	end

	def self.least_popular_show
		# show = Show.all.select {|show| show.rating == Show.lowest_rating}
		# show[0]
		Show.where("rating = ?", Show.lowest_rating).first
	end

	def self.ratings_sum
		Show.sum(:rating)
	end

	def self.popular_shows
		Show.where("rating > 5")
	end

	def self.shows_by_alphabetical_order
		Show.order(name: :asc)
	end

end