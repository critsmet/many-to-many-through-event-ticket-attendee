class Ticket

  attr_reader :attendee, :event

  @@all = []

  def self.all
    @@all
  end

  def initialize(attendee, event)
    @attendee = attendee
    @event = event
    @@all << self
  end
  
end

# Ticket.all
    # Returns an array of all Ticket instances
