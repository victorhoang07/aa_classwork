require_relative "room"

class Hotel
  
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else return false
        end
    end

    def check_in(name, room_name)
        if !self.room_exists?(room_name)
            p 'sorry, room does not exist'
        else
            if @rooms[room_name].add_occupant(name)
                p 'check in successful'
            else
                p "sorry, room is full"
            end
        end
    end
    
    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{v.available_space}"
        end
    end

end
