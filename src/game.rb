# This class manages the players as well as the field.
class Game < Location
	def initialize(window, font, players)
		super(window, font)

		@completed = false
		@penguins = []
		@toasts = []
		@field = Field.new

		players.times do
			@penguins << Penguin.new
		end
	end

	def draw
		@penguins.each(&:draw)
		@toasts.each(&:draw)
	end
end
