require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

lucy = Attendee.new("Lucy", 22)
sarah = Attendee.new("Sarah", 26)
janet = Attendee.new("Janet", 29)
elbert = Attendee.new("Elbert",30)
donn = Attendee.new("Donn",34)

e1 = Event.new("Sofar", 500, 15)
e2 = Event.new("Reputation", 50000, 35)
e3 = Event.new("Puffs", 10000, 17)

t1 = Ticket.new(sarah, e1)
t2 = Ticket.new(elbert, e1)
t3 = Ticket.new(lucy, e2)
t4 = Ticket.new(janet, e1)
t5 = Ticket.new(donn, e1)
t6 = Ticket.new(sarah, e3)
t7 = Ticket.new(elbert, e3)

#The variable `lucy` will point to an instance of a new attendee

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
