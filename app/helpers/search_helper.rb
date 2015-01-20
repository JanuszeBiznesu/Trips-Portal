module SearchHelper
	
	def get_countries
		Country.all.append(Country.new(id: 0, name: "Any"))
	end

end
