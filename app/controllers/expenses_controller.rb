class ExpensesController < ApplicationController

  before_action :set_expense, only: %i[show update edit destroy]

  def index
    @tab = :expenses
    @expenses = Expense.all
    @categories = Category.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params_expenses)
    if @expense.save
      redirect_to expenses_path
      flash[:notice] = "Expense ha sido creado satisfactoriamente"   
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @expense.update(params_expenses)
      redirect_to expenses_path, notice: "El Gasto ha sido Editado"
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: "El gasto ha sido Eliminado"    
  end
  

  private

  def params_expenses
    params.require(:expense).permit(:id, :type_id, :date, :concept, :category_id, :amount).merge(user:current_user)  
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
