class Menu < Location
	def initialize(window, font)
		super window, font

		@players = 2
	end

	def button_down(id)
		case id
		when Gosu::KbLeft
			@players -= 1 if @players > 1
		when Gosu::KbRight
			@players += 1
		when Gosu::KbUp
			@players += 1
		when Gosu::KbDown
			@players -= 1 if @players > 1
		end
    end

    def button_up(id)
		case id
		when Gosu::KbReturn
			# Create a game and start it.
			@window.game = Game.new(@window, @font, @players)
			@window.location = @window.game
		end
	end

	def draw
		@font.draw_rel("Toasty Penguin Party", (@window.width / 2), (@window.height * 0.4), ZOrder::Menu, 0.5, 0.5, 2.0, 2.0)
		@font.draw_rel("#{@players} Players", (@window.width / 2), (@window.height * 0.6), ZOrder::Menu, 0.5, 0.5, 1.7, 1.7)
		@font.draw_rel("Arrow keys adjust number of players", (@window.width / 2), (@window.height * 0.7), ZOrder::Menu, 0.5, 0.5, 1.2, 1.2)
		@font.draw_rel("Press enter to begin", (@window.width / 2), (@window.height * 0.9), ZOrder::Menu, 0.5, 0.5, 1.3, 1.3)
	end
end
