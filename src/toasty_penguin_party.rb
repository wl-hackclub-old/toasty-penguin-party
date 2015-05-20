#! /usr/bin/env ruby

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
	attr_writer :location
	attr_writer :game

	def initialize
		# This creates the window and such.
		#      w,   h,  fullscreen
		super 800, 400, false
		self.caption = "Toasty Penguin Pool"

		# Valid locations are :menu, :game, and :credits.
		@location = :menu

		font = Gosu::Font.new(self, Gosu::default_font_name, 20)
		@menu = Menu.new(self, font)
		@credits = Credits.new(self, font)
		@game = nil
	end

	# Allows a button to be held down and still activated.
	def button_down(id)
		case @location
        when :menu
            @menu.button_down(id)
        when :game
            @game.button_down(id)
        when :credits
            @credits.button_down(id)
        end
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
		end

		case @location
        when :menu
            @menu.button_up(id)
        when :game
            @game.button_up(id)
        when :credits
            @credits.button_up(id)
        end
	end

	def update
		case @location
		when :menu
			@menu.update
		when :game
			@game.update
		when :credits
			@credits.update
		end
	end

	def draw
		case @location
		when :menu
			@menu.draw
		when :game
			@game.draw
		when :credits
			@credits.draw
		end
	end

	# Give us a mouse pointer; we'll want to use it for gameplay.
	def needs_cursor?
		true
	end
end

# This code actually makes the window open.
window = GameWindow.new
window.show
