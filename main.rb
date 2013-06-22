require 'pry'

require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

  def menu
    puts `clear`
    puts "************$tock$************"
    puts "\nWelcome to $tock$, the number one Stock Brokerage App for professionals on a budget."
    puts "\n      $"
    puts "   ,$$$$$,"
    puts " ,$$$'$`$$$"
    puts " $$$  $   `"
    puts " '$$$,$"
    puts "  '$$$$,"
    puts "     '$$$$,"
    puts "      $ $$$,"
    puts "  ,   $  $$$"
    puts "  $$$,$.$$$'"
    puts "  '$$$$$'"
    puts "      $"
    puts "\nWhat would you like to do?"
    puts "***********************************"


    puts "To see the list of our clients, press A+Enter"
    puts "To access your individual account, press B+Enter"
    puts "To create a new client account, press C+Enter"
    puts "To quit, simply press Q+Enter"
    gets.chomp.downcase
  end

client = Client.new

#clients in $tocks$ database
client_1 = Client.new "Barney", 10000
client_2 = Client.new "Ted", 5000
client_3 = Client.new "Marshall", 2000
client_4 = Client.new "Robin", 10000
client_5 = Client.new "Lily", 3000

while response != 'q'
  case response
    when 'a'
      puts "***********************************"
        puts "\nCurrently up for adoption:"
        puts happytails.available.keys.join(", ")
       puts "***********************************"
        puts
        puts "Some more details about these pets:"
        puts
        happytails.available.each do |key, animal|
          puts "\n#{key.upcase}: #{animal.name} is a beautiful #{animal.age} year-old #{animal.sex} #{animal.breed} who loves #{animal.favorite_toy} above everthing else. "
        end
        puts
        puts "Please press Enter to come back to the main menu"
        gets

    when 'b'
      puts "***********************************"
        puts "\nThis is the list of our clients:"
        puts happytails.clients.keys.join(", ")
      puts "***********************************"
        puts "\nWhich one is you? Please enter your name:"
        name = gets.chomp.downcase.to_sym
        puts
        puts "What fantastic animal will you be bringing home today?"
        puts "\nAvailable today are: "
        puts
        puts happytails.available.keys.join(", ")
        puts
        puts "Please enter the name of the pet you would like to adopt:"
        adoption_choice = gets.chomp.downcase.to_sym
        happytails.adopt (name), (adoption_choice)
        puts
        puts "Thank you for making #{adoption_choice} a new member of your family!"
        puts
        puts "Please press Enter to come back to the main menu"
        gets

    when 'a'
      puts "***********************************"
        puts "\nThis is the list of our clients:"
        puts happytails.clients.keys.join(". ")
      puts "*******************************************************************"
        puts "\nWhich one is you? Please enter your name:"
        name = gets.chomp.downcase.to_sym
        puts
        puts happytails.clients[name].animals.keys.join(". ")
        puts "Please enter the name of your pet:"
        give_up = gets.chomp.downcase.to_sym
        happytails.taking_in (name), (give_up)
        puts
        puts "Thank you. We will make sure #{give_up} finds a good home!"
        puts
        puts "Please press Enter to come back to the main menu"
        gets

    when 'd'
      puts "***********************************"
        puts "\nOur clients:"
        puts happytails.clients.keys.join(", ")
      puts "***********************************"
        puts
        puts "In more details..."
        happytails.clients.each do |key, client|
          puts "\n#{key.upcase}: #{client.name} is #{client.sex}, #{client.age} year-old and has #{client.kids} kid(s). Currently owns #{client.animals} pet(s). "
        end
        puts
        puts "Please press Enter to come back to the main menu"
        gets

end

response = menu

end
binding.pry