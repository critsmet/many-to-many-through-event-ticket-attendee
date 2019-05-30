require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

yale = Venue.new("Yale", "New Haven", 100)

lucy = Attendee.new("Lucy", 22)
max = Attendee.new("Max", 19)
richard = Attendee.new("Richard", 20)
xavier = Attendee.new("Xavier", 21)
peter = Attendee.new("Peter", 80)
prince = Attendee.new("Prince", 1)

spring_fling = Event.new("Spring Fling", 100, 10, yale)
flatiron_camp = Event.new("Flatiron Camp", 1000, 200, yale)

Ticket.new(lucy, spring_fling)
Ticket.new(max, spring_fling)
Ticket.new(max, flatiron_camp)
Ticket.new(xavier, flatiron_camp)
Ticket.new(richard, flatiron_camp)
Ticket.new(prince, flatiron_camp)
Ticket.new(peter, flatiron_camp)

#The variable `lucy` will point to an instance of a new attendee

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
