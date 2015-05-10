#! /usr/bin/env ruby

require "gosu"

require_relative "game"
require_relative "field"
require_relative "penguin"

class GameWindow < Gosu::Window
	def initialize
		super 800, 400, false

		@in_menu = true
	end

	# Allows a button to be held down and still activated.
	def button_down(id)
	end

	# Only allows the button to be pressed once for this to run.
	def button_up(id)
		case id
		when Gosu::KbEscape
			if @in_menu
				close
			else
				@in_menu = true
			end
		when Gosu::KbReturn
			@in_menu = false
		end
	end

	def update
	end

	def draw
	end
end

# This code actually makes the window open.
window = GameWindow.new
window.show
