class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @categories = Category.all
  end

  def new
    @expense = Expense.new
  end

end
