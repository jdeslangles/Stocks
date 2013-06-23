class Portfolio

  attr_accessor :name, :value, :stocks

  def initialize(name)
    @name = name
    @value = value
    @stocks = {}
  end


  def to_s
    "The #{name} portfolio currently contains shares in #{stocks.size} company(ies) and has an estimated value of $#{portfolio_value}."
  end

  def portfolio_value
    initial_value = 0
    stocks.each_value do |stock|
      initial_value += stock.value
    end
  end

  # f = File.new('stock-value.txt', 'a+')
  #   begin
  #     portfolio = []
  #     f.each do |line|
  #       stock_array = line.chomp.split(', ')
  #       stock = Stock.new(stock[0], stock[1])
  #       portfolio << stock
  #   ensure
  #     f.close
  # end


end