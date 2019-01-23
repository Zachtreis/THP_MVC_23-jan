require_relative 'gossip'
require_relative 'view'


class Controller


	def initialize
		@view = View.new
	end

	def create_gossip
		params = @view.create_gossip
		gossip = Gossip.new(params["author"], params["content"]) 
		gossip.save
	end

	def index_gossips
		gossips = Gossip.all
		@view.index_gossips(gossips)
	end

	def delete(num)
		gossips = Gossip.all
		if num < 1 || num > gossips.length
			puts "Ce choix n'existe pas, merci de reessayer".green
		else
			CSV.open("db/gossip_prov.csv", "a") do |file|
				CSV.foreach("db/gossip.csv") do |ligne|
					if $. != num
						file << [ligne[0], ligne[1]]
					end
				end
			end
			File.delete("db/gossip.csv")
			File.rename("db/gossip_prov.csv", "db/gossip.csv")
			puts "C'est efface !".green
			puts ""
		end
	end
	
end