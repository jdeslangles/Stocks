require 'pry'
require 'yahoofinance'

require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

f = File.new('clients.txt', 'r')
  begin
    clients = []
    f.each do |line|
    details = line.chomp.split(', ')
    client = Client.new(details[0], details[1].to_f)
    clients << client
  end
  ensure
    f.close
  end

  def menu
    puts `clear`
    puts "************$tock$************"
    puts "\nWelcome to $tock$, "
    puts "The number one Stock Brokerage App"
    puts "for professionals on a budget."
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
    puts "--> To access the (E)xisting Client Account menu, press E+Enter"
    puts "--> To create a (N)ew Client Account, press N+Enter"
    puts "--> Are you a (C)lient? To manage your account, press C+Enter"
    puts "--> To (Q)uit, simply press Q+Enter"
    gets.chomp.downcase
  end

response = menu

while response != 'q'
  case response
    when 'e'
      puts `clear`
      puts "\nExisting Client Accounts:"
      puts "***********************************"
      clients.each_index do |index|
        puts "Account (#{index}) #{clients[index].to_s}"
      end
      puts
      puts "--> To list a client's portfolios, select his account number:"
      client_selection = gets.chomp.to_i
      puts "\n#{clients[client_selection].name}'s portfolios:"
      puts "***********************************"
      puts clients[client_selection].portfolios
      puts
      puts "--> Please press Enter to come back to the main menu"
      gets

    # when 'n'
    #   puts "***********************************"
    #   puts "\nNew Client Account:"
    #   puts "***********************************"
    #   puts "\nPlease enter your name:"
    #   name = gets.chomp.downcase.to_sym

    #     puts happytails.available.keys.join(", ")
    #     puts
    #     puts "Please enter the name of the pet you would like to adopt:"
    #     adoption_choice = gets.chomp.downcase.to_sym
    #     happytails.adopt (name), (adoption_choice)
    #     puts
    #     puts "Thank you for making #{adoption_choice} a new member of your family!"
    #     puts
    #     puts "Please press Enter to come back to the main menu"
    #     gets

    when 'c'
      puts `clear`
      puts "\nClient Login - Managing your Account:"
      puts "***********************************"
      clients.each_index do |index|
        puts "Account (#{index}) #{clients[index].to_s_login}"
      end
      puts "--> To access your account, select your account number:"
      client_selection = gets.chomp.to_i
      puts "\nHi #{clients[client_selection].name}, what would you like to do?"
      puts "***********************************"
      puts "--> Add/Withdraw (F)unds, press F + Enter"
      puts "--> Create a (P)ortfolio, press P + Enter"
      puts "--> (T)rade, press T + Enter"
      option = gets.chomp.downcase

      case option
        when "f"
          puts "\nWhat amount will you be transfering today?"
          transfered_funds = gets.chomp.to_f
          clients[client_selection].transfering_funds(transfered_funds)
        when "p"
          puts "\nWhat will you call your portfolio?"
          portfolio_name = gets.chomp
          clients[client_selection].portfolios << Portfolio.new(portfolio_name)
          puts "Your new #{portfolio_name} portfolio has been added."
        when "t"
          puts `clear`
          puts "What would you like to do?"

        end



      puts
      puts "--> Please press Enter to come back to the main menu"
      gets

    #     puts happytails.clients.keys.join(". ")
    #   puts "*******************************************************************"
    #     puts "\nWhich one is you? Please enter your name:"
    #     name = gets.chomp.downcase.to_sym
    #     puts
    #     puts happytails.clients[name].animals.keys.join(". ")
    #     puts "Please enter the name of your pet:"
    #     give_up = gets.chomp.downcase.to_sym
    #     happytails.taking_in (name), (give_up)
    #     puts
    #     puts "Thank you. We will make sure #{give_up} finds a good home!"
    #     puts
    #     puts "Please press Enter to come back to the main menu"
    #     gets
  end
response = menu

end
binding.pry