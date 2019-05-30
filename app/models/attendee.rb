class Attendee
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def events
        Ticket.all.select do |ticket|
            ticket.attendee == self
        end.map do |ticket|
            ticket.event
        end
    end

    def money_spent
        money = 0
        self.events.each do |event|
            money += event.ticket_price
        end
        money
    end
end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events