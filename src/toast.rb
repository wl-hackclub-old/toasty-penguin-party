#the coordinate system i am using will allow decimal numbers for coordinates and more flexibility
#this program will place pieces of toast randomly on the field
#i have not tested it so we might have to make changes
require "field.rb"
class Toast < Entity
	super(xloc,yloc)
	@@TOASTLIMIT = 100 #the maximum number of pieces of toast that can be placed
	@@totalpieces = 0
	def initialize
		if @@totalpieces < @@TOASTLIMIT
			@xloc = Gosu::random(0,Field::xsize) #toast will be placed on a random coordinate within the field
			@yloc = Gosu::random(0,Field::ysize)# this will change when the field changes
		   @@totalpieces += 1 
		end
	end
	def iscaptured?(penguin)
		if ((penguin.xloc-@xloc)**2+(penguin.yloc-@yloc)**2) <= 2 #if penguin is within 2 units away from toast, the toast will be picked up
			penguin.toast_collected += 1
		end
	end
end
