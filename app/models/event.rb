class Event

  attr_reader :name, :total_cost
  attr_accessor :ticket_price

  @@all = []

  def self.all
    @@all
  end

  def initialize(name,total_cost,ticket_price)
    @name = name
    @total_cost = total_cost
    @ticket_price = ticket_price
    @@all << self
  end

  def tickets
    Ticket.all.select do |ticket|
      ticket.event == self
    end
  end

  def ticket_sale_total
    self.tickets.count * self.ticket_price
  end

  def sales_to_break_even
   if (self.total_cost - self.ticket_sale_total) > 0
     ((self.total_cost - self.ticket_sale_total)/self.ticket_price)
   else
     0
   end
  end

  def attendees
    self.tickets.map do |ticket|
      ticket.attendee
    end
  end

  def average_age
    age_array = self.attendees.map do |attendee|
      attendee.age
    end
    age_array.inject {|sum, element| sum + element}.to_f/age_array.size
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
