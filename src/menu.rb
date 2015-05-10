class Menu < Drawer
	def initialize(window, font)
		super(window, font)
	end

	def draw
		@font.draw("Test", 0, 0, 0)
	end
end
