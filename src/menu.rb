class Menu < Location
	def button_up(id)
		case id
		when Gosu::KbReturn
			# Create a game and start it.
			@window.game = Game.new(@window, @font)
			@window.location = :game
		end
	end

	def draw
		@font.draw("Test", 0, 0, 0)
	end
end
