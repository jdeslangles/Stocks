class Client

  attr_accessor :name, :budget, :portfolio

  def initialize(name, budget, portfolio)
    @name = name
    @budget = budget
    @portfolio = portfolio
  end


  def to_s
    "#{@name}'s account has a current balance of $#{@budget}."
  end
end