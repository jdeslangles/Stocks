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

# "Existing client account" menu - can list accounts and portfolios

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

# "Create new account" menu

    when 'n'
      puts `clear`
      puts "\nNew Client Account:"
      puts "***********************************"
      puts "\nPlease enter the Client's name:"
      name = gets.chomp.downcase
      puts "\nWhat amount will the Client deposit into his new account?"
      amount = gets.chomp.to_f
      puts "=> You successfully opened #{name}'s new account. The current balance is $#{amount}."
      clients << Client.new(name, amount)
      puts
      puts "Please press Enter to come back to the main menu"
      gets

# "Personal finance/client login" menu

    when 'c'
      puts `clear`
      puts "\nClient Login - Managing your Account:"
      puts "***********************************"
      clients.each_index do |index|
        puts "Account (#{index}) #{clients[index].to_s_login}"
      end
      puts "\n--> To access your account, select your account number:"
      client_selection = gets.chomp.to_i
      puts "\nHi #{clients[client_selection].name}, what would you like to do?"
      puts "***********************************"
      puts "--> Add/Withdraw (F)unds, press F + Enter"
      puts "--> Create a (P)ortfolio, press P + Enter"
      puts "--> (T)rade, press T + Enter"
      option = gets.chomp.downcase

      case option

        # Add/Withdraw funds

        when "f"
          puts "\nWhat amount will you be transfering today?"
          transfered_funds = gets.chomp.to_f
          clients[client_selection].transfering_funds(transfered_funds)

        # Create portfolio

        when "p"
          puts "\nWhat will you call your portfolio?"
          puts "***********************************"
          portfolio_name = gets.chomp
          clients[client_selection].portfolios << Portfolio.new(portfolio_name)
          puts "=> Your new #{portfolio_name} portfolio has been added."

        # Trade menu

        when "t"
          puts `clear`
          puts "\n#{clients[client_selection].name}'s $tock$ Trading Platform"
          puts "***********************************"
          puts  "\n#{clients[client_selection].name}'s exisiting portfolios: "
          clients[client_selection].portfolios_listing
          puts "\nPlease select your portfolio before proceeding."
          portfolio_selection = gets.chomp.to_i
          puts "\nWhat would you like to do?"
          puts "--> Get the latest (Q)uotes, press Q + Enter"
          puts "--> (B)uy stocks, press B + Enter"
          puts "--> (S)ell stocks, press S + Enter"
          trade_choice = gets.chomp.downcase

          case trade_choice
          when "q"
            puts "\nWhich share price are you interested in?"
            puts "***********************************"
            puts "Please enter the company's ticker (e.g. AAPL) + Enter:"
            ticker = gets.chomp.upcase.to_s
            value = YahooFinance::get_standard_quotes( ticker )[ ticker ].lastTrade
            name = YahooFinance::get_standard_quotes( ticker )[ ticker ].name
            puts "\n=> #{name} is currently trading at $#{value} per share."
            puts
            puts
            puts
            puts "###################################################################"
            puts "### Please be advised that displayed quotes are 15 minutes old !###"
            puts "###################################################################"
          when "b"
            puts "\nWhich share are you interested in buying?"
            puts "***********************************"
            puts "Please enter the company's ticker (e.g. AAPL) + Enter:"
            ticker = gets.chomp.upcase.to_s
            value = YahooFinance::get_standard_quotes( ticker )[ ticker ].lastTrade
            name = YahooFinance::get_standard_quotes( ticker )[ ticker ].name
            puts "\n=> #{name} is currently trading at $#{value} per share."
            puts
            puts "How many #{name} shares would you like to buy?"
            puts "***********************************"
            buy_number = gets.chomp.to_i
            if ( buy_number*value) <= clients[client_selection].available_funds
              if clients[client_selection].portfolios[portfolio_selection].stocks.include?(ticker)
                clients[client_selection].portfolios[portfolio_selection].stocks[ticker].number += buy_number
                clients[client_selection].available_funds -= (value * buy_number)
                puts "=> You successfully purchased #{buy_number} #{name} shares at $#{value} per share. You now hold a total of #{clients[client_selection].portfolios[portfolio_selection].stocks[ticker].number} #{name} shares, and $#{(value*buy_number)} have been debited from your acount."
              else
                clients[client_selection].portfolios[portfolio_selection].stocks[ticker] = Stock.new(ticker, buy_number)
                clients[client_selection].available_funds -= (value * buy_number)
                puts "\n=> You successfully purchased #{buy_number} #{name} shares at $#{value} per share. You now hold a total of #{clients[client_selection].portfolios[portfolio_selection].stocks[ticker].number} #{name} shares, and $#{(value*buy_number)} have been debited from your acount."
              end
            else
              puts "\n=>Sorry - it would seem you do not currently have sufficient funds for this transaction. Please add funds to your account before proceeding."
            end

          when "s"
            puts "\nWhich share are you interested in selling?"
            puts "***********************************"
            puts "Please enter the company's ticker (e.g. AAPL) + Enter:"
            ticker = gets.chomp.upcase.to_s
            value = YahooFinance::get_standard_quotes( ticker )[ ticker ].lastTrade
            name = YahooFinance::get_standard_quotes( ticker )[ ticker ].name
            puts "\n=> #{name} is currently trading at $#{value} per share."
              if clients[client_selection].portfolios[portfolio_selection].stocks.include?(ticker)
              puts "=> You currently hold #{clients[client_selection].portfolios[portfolio_selection].stocks[ticker].number} #{clients[client_selection].portfolios[portfolio_selection].stocks[ticker].stock_name} shares."
              puts "How many share would you like to sell?"
              puts "***********************************"
              sell_number = gets.chomp.to_i
              clients[client_selection].available_funds += (sell_number * value)
              clients[client_selection].portfolios[portfolio_selection].stocks[ticker].number -= sell_number
              puts "\n=> You successfully sold #{sell_number} #{name} shares at $#{value} per share. You now hold a total of #{clients[client_selection].portfolios[portfolio_selection].stocks[ticker].number} #{name} shares, and $#{(value*sell_number)} have been credited to your acount."
              else
              puts "=> You do not own this stock."
              end
            end

        end

      puts
      puts "--> Please press Enter to come back to the main menu"
      gets

  end
response = menu

end
binding.pry