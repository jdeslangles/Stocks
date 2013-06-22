class Client

  attr_accessor :name, :initial_budget, :balance, :portfolios

  def initialize(name, initial_budget, balance)
    @name = name
    @initial_budget = initial_budget
    @portfolios = {}
  end


  def to_s
    "#{@name}'s account has a current balance of $#{@balance}. He owns #{@portfolios.size} portfolios"
  end

  def create_portfolio
    #do stuff
  end

  def buy_stock
    #do stuff
  end

  def sell_stock
    #do stuff
  end




end