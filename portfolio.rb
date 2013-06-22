class Portfolio

  attr_accessor :name, :value, :stocks

  def initialize(name, budget, stocks)
    @name = name
    @value = value
    @stocks = {}
  end


  def to_s
    "#{name}'s account has a current balance of $#{budget}."

end