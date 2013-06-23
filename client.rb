class Client

  attr_accessor :name, :available_funds, :balance, :portfolios

  def initialize(name, available_funds)
    @name = name
    @available_funds = available_funds
    @portfolios = []
  end

  def to_s_login
    "#{name}"
  end
  def to_s
    "#{name} => current balance of $#{available_funds}; #{portfolios.size} portfolios"
  end

  def transfering_funds(transfered_funds)
    @available_funds += transfered_funds
    puts "=> You now have a total of $#{available_funds}."
  end

  # def create_portfolio
  #   #do stuff
  # end

  def portfolios_listing
    portfolios.each_index do |index|
    puts "Portfolio (#{index}) : #{portfolios.to_s}"
    end
  end

#   def buy_stock
#     #do stuff
#   end

#   def sell_stock
#     #do stuff
#   end
# end

end