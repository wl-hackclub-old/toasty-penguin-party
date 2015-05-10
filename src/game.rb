# This class manages the players as well as the field.
class Game
	def initialize
		@completed = false
		@penguins = []
		@toasts = []
		@field = Field.new
	end
end
