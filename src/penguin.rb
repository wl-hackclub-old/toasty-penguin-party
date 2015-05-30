class Penguin < Entity
	attr_accessor :speed
	attr_accessor :toast_collected
  attr_accessor :angle
	def initialize
		super(xloc,yloc)
		@xloc=@yloc = 0
	end
   def launch
   	if Gosu::button_down?(Gosu::MsLeft)
   	@angle = Gosu::angle(0,0,(Gosu::Window::mouse_y),(Gosu::Window::mouse_x))
   	while @speed != 0
   		@xloc += Gosu::offset_x(@angle,speed)
   		@yloc += Gosu::offset_y(@angle,speed)
   		speed -= 1
   		if @xloc >= Field::xsize or @yloc >= Field::ysize #this will be changed later if we decide to randomize the field
   			@angle += 90
   		end
   	end
   end
  end
end

