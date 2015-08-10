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

	# Allows a button to be held down and still activated.
	def button_down(id)
		@location.button_down(id)
	end

	# Only allows the button to be pressed once for this to run.
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
