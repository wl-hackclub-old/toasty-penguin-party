class Menu < Location
	def button_up(id)
		case id
		when Gosu::KbReturn
			# Create a game and start it.
			@window.game = Game.new(@window, @font, 2)
			@window.location = :game
		end
	end

	def draw
		@font = Gosu::Font.new(@window, Gosu::default_font_name, 20)
		@font.draw_rel("Toasty Penguin Party", (@window.width / 2), (@window.height / 2) - 70, ZOrder::Menu, 0.5, 0.5, 2.0, 2.0, 0xffffffff)
	end
end
