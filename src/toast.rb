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
			self.xloc = Gosu::random(0,Field::xsize) #toast will be placed on a random coordinate within the field
			self.yloc = Gosu::random(0,Field::ysize)
		   @@totalpieces += 1 
		end
	end
end
