class Event
    attr_reader :name, :total_cost, :ticket_price, :venue

    @@all = []

    def initialize(name, total_cost, ticket_price, venue)
        @name = name
        @total_cost = total_cost
        @ticket_price = ticket_price
        @venue = venue
        @@all << self
    end

    def self.all
        @@all
    end

    def sales_to_break_even
        tickets_sold = Ticket.all.select do |ticket|
            ticket.event == self
        end

        number_sold = tickets_sold.size

        cost_left = @total_cost - (number_sold * @ticket_price)

        tickets_needed = cost_left / @ticket_price
    end

    def attendees
        Ticket.all.select do |ticket|
            ticket.event == self
        end.map do |ticket|
            ticket.attendee
        end
    end

    def average_age
        ages = self.attendees.map do |attendee|
            attendee.age
        end

        age_sum = ages.inject do |sum, age|
            sum + age
        end.to_f

        average = age_sum / self.attendees.size
    end
end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0. 
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
