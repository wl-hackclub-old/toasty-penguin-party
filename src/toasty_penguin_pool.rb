#! /usr/bin/env ruby

require "gosu"

require_relative "game"
require_relative "field"
require_relative "penguin"

class GameWindow < Gosu::Window
	def initialize
		# This creates the window and such.
		#      w,   h,  fullscreen
		super 800, 400, false
		self.caption = "Toasty Penguin Pool"

		# Valid locations are :menu, :game, and :credits.
		@location = :menu
	end

	# Allows a button to be held down and still activated.
	def button_down(id)
	end

	# Only allows the button to be pressed once for this to run.
	def button_up(id)
		case id
		when Gosu::KbEscape
			if @location == :menu
				close
			else
				@location = :menu
			end
		when Gosu::KbReturn
			@location = :game
		end
	end

	def update
	end

	def draw
	end

	# Give us a mouse pointer; we'll want to use it for gameplay.
	def needs_cursor?
		true
	end
end

# This code actually makes the window open.
window = GameWindow.new
window.show
