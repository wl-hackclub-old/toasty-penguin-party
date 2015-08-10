# This class manages the players as well as the field.
class Game < Location
	def initialize(window, font, players)
		super(window, font)

		@completed = false
		@penguins = []
		@toasts = []
		@field = Field.new
		@players = players
		@turn = 0

		players.times do
			@penguins << Penguin.new
		end
	end

	def draw
		@font.draw_rel("It is player #{@turn + 1} turn.", 10, 20, 0.0, 0.0, 1.0, 1.0)

		@penguins.each(&:draw)
		@toasts.each(&:draw)
	end

	def increment_turn
		@turn += 1
		if @turn == @players
			@turn = 0
		end
	end
end
