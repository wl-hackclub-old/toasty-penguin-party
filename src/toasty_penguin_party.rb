require "matrix"
require "gosu"

require_relative "entity"
require_relative "location"
require_relative "credits"
require_relative "field"
require_relative "game"
require_relative "menu"
require_relative "penguin"
require_relative "toast"

module ZOrder
	Background, Board, Player, Toast, UI, Menu = *0..6
end

class GameWindow < Gosu::Window
	attr_accessor :game

	attr_writer :location

	def initialize
		# This creates the window and such.
		#      w,   h,  fullscreen
		super 800, 400, false
		self.caption = "Toasty Penguin Pool"

		font = Gosu::Font.new(self, Gosu::default_font_name, 20)
		@menu = Menu.new(self, font)
		@credits = Credits.new(self, font)
		@game = nil

		# Valid locations are @menu, @game, and @credits.
        @location = @menu
	end

	# Use this normally; action is done when somebody presses the button, not releases.
	def button_down(id)
		@location.button_down(id)
	end

	# Use this for scary actions; nothing will happen until the key is released.
	def button_up(id)
		case id
		when Gosu::KbEscape
			if @location == @menu
				close
			else
				@location = @menu
			end
		end

		@location.button_up(id)
	end

	# When allowing held down buttons, use the button_down? method in update.
	# In subcontexts, this will have to be done with @window.button_down?
	def update
		@location.update
	end

	def draw
		@location.draw
	end

	# Give us a mouse pointer; we'll want to use it for gameplay.
	def needs_cursor?
		true
	end
end

# This code actually makes the window open.
window = GameWindow.new
window.show
