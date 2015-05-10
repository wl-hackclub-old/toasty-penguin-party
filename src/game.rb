# This class manages the players as well as the field.
class Game
	def initialize
		@completed = false
		@penguins = []
		@field = Field.new
	end
end
