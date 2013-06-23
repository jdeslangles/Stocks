class Stock

require 'yahoofinance'

  attr_accessor :ticker, :stock_price, :number, :stock_name

  def initialize(ticker, number)
    @ticker = ticker
    @number = number
    @stock_price = YahooFinance::get_standard_quotes( @ticker.to_s )[ @ticker.to_s ].lastTrade
    @stock_name = YahooFinance::get_standard_quotes( @ticker.to_s )[ @ticker.to_s ].name
  end

    # f = File.new('stock-value.txt', 'w+')
    # def get_ticker
    #   print "What stock would you like to buy? Please enter the ticker (ex.AAPL):"
    #    gets.chomp.upcase
    # end
    # begin
    #   response = get_ticker
    #   value = YahooFinance::get_standard_quotes( response )[ response ].lastTrade
    #   f.puts "#{response}, #{value}"
    # ensure
    #   f.close
    # end

    def value
        value = @number * @stock_price
    end

    def to_s
      "#{ticker} --->#{number} #{stock_name} shares; total current value estimated at $#{(stock_price*number).round(4)}"
    end
end
