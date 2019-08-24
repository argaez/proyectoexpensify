module ExpensesHelper
    
    def modal_action
        @expense.new_record? ? 'Create expense' : 'Edit expense'
    end
end
