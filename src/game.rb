# This class manages the players as well as the field.
class Game < Location
	def initialize(window, font)
		super(window, font)

		@completed = false
		@penguins = []
		@toasts = []
		@field = Field.new
	end

	def draw
	end
end
