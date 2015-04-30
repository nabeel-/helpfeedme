class FindController < ApplicationController
	def search
		p = params[:q]

		@res = Restaurant.search(p)
		@query = p
	end
end
