class Entity
	attr_accessor :xloc
	attr_accessor :yloc
	def draw
	end
	def onboundary?(field)
			for i in 0..field.vertexarray.length
		if ((field.vertexarray[i+1][1]-field.vertexarray[i][1])/(field.vertexarray[i+1][0]-field.vertexarray[i][0]) == (@yloc-field.vertexarray[i][1])/(@xloc-fieldvertexarray[i][0])) and (field.vertexarray[i][0] <= @xloc <= field.vertexarray[i+1][0])
	#detects if the line between the penguin and a vertex of the field has the same slope as on of the sides and if the x coordinate of the penguin is between the x coordinates of the endpoints of the side
	#we still need to find an easy way to determine how many degrees a penguin should turn in order to make its path a reflection of the wall because the walls will no longer be placed at riht angles
	end
end
end 
end