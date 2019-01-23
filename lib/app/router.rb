require_relative 'controller'

class Router
	
	# un "Router.new" lancé par app.rb va créer automatique une instance "@controller"
	def initialize
		@controller = Controller.new
	end

	def perform
		puts "Bienvenue dans The Gossip Project (TGP)"
		puts ""
		while true
			puts "Tu veux faire quoi BG ?".green
			puts ""
			puts "1. Je veux creer un gossip".green
			puts "2. Afficher tous les potins".green
			puts "3. Effacer un potin".green
			puts "4. Je veux quitter l'app".green
			puts ""
			print ">".green
			params = gets.chomp.to_i
			puts ""

			case params
			when 1
				puts "Tu as choisi de creer un gossip".green
				puts ""
				@controller.create_gossip
			when 2
				puts "Voici tous les potins".green
				puts ""
				@controller.index_gossips
			when 3
				puts "Quel gossip veux-tu effacer ?".green
				puts ""
				@controller.index_gossips
				puts ""
				print ">".green
				destroy = gets.chomp.to_i
				@controller.delete(destroy)
				puts ""
			when 4
				puts "A bientot !".green
				puts ""
				break
			else
				puts "Ce choix n'existe pas, merci de reessayer".green
			end
		end
	end
end