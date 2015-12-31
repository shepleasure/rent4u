class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@baby = @categories[0]
		@book = @categories[1]
		@camera = @categories[2]
		@costume = @categories[3]
		@electronic = @categories[4]
		@event = @categories[5]
		@media = @categories[6]
		@medical = @categories[7]
		@musical = @categories[8]
		@realestate = @categories[9]
		@service = @categories[10]
		@sport = @categories[11]
		@vehicle = @categories[12]
	end

	def show
		
	end
end
