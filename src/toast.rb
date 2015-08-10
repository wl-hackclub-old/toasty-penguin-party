#the coordinate system i am using will allow decimal numbers for coordinates and more flexibility
#this program will place pieces of toast randomly on the field
#i have not tested it so we might have to make changes
require "field.rb"
require "random"
class Toast < Entity
	super(location)
	@@TOASTLIMIT = 100 #the maximum number of pieces of toast that can be placed
	@@totalpieces = 0
	def initialize
		if @@totalpieces < @@TOASTLIMIT
			self.location = [Random::rand(Field::xsize),Random::rand(Field::ysize)] #toast will be placed on a random coordinate within the field
		   @@totalpieces += 1 
		end
	end
end
