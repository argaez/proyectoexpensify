class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @categories = Category.all
  end

  def new
    @expense = Expense.new
  end


  private

  def params_expenses
    params.require(:expenses).permit(:id, :type_id, :date, :concept, :category_id, :amount).merge(user:current_user)  
  end
end
