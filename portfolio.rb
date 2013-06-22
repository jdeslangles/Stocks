class Portfolio

  attr_accessor :name, :value, :stocks

  def initialize(name, budget, stocks)
    @name = name
    @value = value
    @stocks = {}
  end


  def to_s
    "The #{name} portfolio currently contains #{@stocks.size} shares and has a current estimated value of $#{@value}."
  end

  f = File.new('stock-value.txt', 'a+')
    begin
      portfolio = []
      f.each do |line|
        stock_array = line.chomp.split(', ')
        stock = Stock.new(stock[0], stock[1])
        portfolio << stock
    ensure
      f.close
  end


  def buy

  end


  def sell

  end


end