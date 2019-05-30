class Venue
    attr_reader :name, :location, :rental_fee

    @@all = []

    def initialize(name, location, rental_fee)
        @name = name
        @location = location
        @rental_fee = rental_fee
        @@all << self
    end

    def self.all
        @@all
    end

    def events
        Event.all.select do |event|
            event.venue == self
        end
    end

    def revenue
        self.events.size * @rental_fee
    end

    def attendees
        attendee_array = []
        self.events.each do |event|
            attendee_array << event.attendees
        end
        attendee_array.flatten
    end

    def guest_lists
        guest_lists = {}
        self.events.each do |event|
            guest_lists[event.name] = event.attendees
        end
        guest_lists
    end
end