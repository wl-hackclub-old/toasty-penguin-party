class Penguin < Entity
	attr_accessor :speed
	attr_accessor :toast_collected
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
   		if @xloc == Field::xsize or @yloc == Field::ysize
   			@angle += 90
   		end

   	end
   end
=begin
        @@toasts = Array.new
        #first make 100 toasts
        100.times do |i|
            coordinates = rand(1..100)
            #each of 100 coordinates is a pt on 10 by 10 grid
            #sorry Linus but 64 by 64 takes a long time to load
            @@toasts.push(coordinates)
        end
=end
=begin        puts "Which direction to launch (N,E,S,W,NE,NW,SE,SW)"
        #Maybe add NNW, NNE, etc.
        @@direction = gets.chomp
        @@trail = Array.new
        case @@direction
        when "N" then @@trail.push(1,2,3,4,5,6,7,8,9,10)
        when "E" then @@trail.push(11,12,13,14,15,16,17,18,19,20)
        when "S" then @@trail.push(21,22,23,24,25,26,28,27,29,30)
        when "W" then @@trail.push(31,33,34,35,32,66,47,39,38,40)
        when "SW" then @@trail.push(41,42,43,44,45,46,37,48,49,50)
        when "NW" then @@trail.push(51,52,53,54,55,56,57,58,59,60)
        when "NE" then @@trail.push(61,62,64,63,65,36,67,68,69,70)
        when "SE" then @@trail.push(71,72,73,75,74,78,76,79,77,80)
        else puts "You disgust me."
        end
        @@u = Array.new
        @@trail.each do |i|
            @@u.push(i)
        end
        servings=(@@toasts & @@u).count
        
        print "You ate "
        puts servings
        puts "toasts."
        if servings > 2
            if servings < 20
                puts "Respectable. The seals won't eat you today."
            else puts "Impressive. The other penguins worship you."
            end
        else puts "How did you not eat two toasts? You starved."
        end
=end
    end
end

