class ExpensesController < ApplicationController
  def index

  	 if user_signed_in?

	  	 @expenses = Expense.order("date DESC").where("user_id = ?", current_user)
	  	 
	  	 if params[:concept].present?
	  	 	@expenses = @expenses.where("concept like ?", '%' + params[:concept] + '%')
	  	 end

	  	 if params[:category_id].present?
	  	 	@expenses = @expenses.where("category_id = ?", params[:category_id])
	  	 end
	  else
	  	redirect_to user_session_path
	  end
  end
end
