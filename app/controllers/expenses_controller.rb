class ExpensesController < ApplicationController
  def index
  	 cri_concepto = params[:concept]
  	 if cri_concepto.nil?
  	 	cri_concepto = ''
  	 end

  	 cri_categoria = params[:category_id]
	 if cri_categoria.nil?
  	 	cri_categoria = ''
  	 end

  	 @expenses = Expense.where("concept like ? AND category_id like ?", '%' + cri_concepto + '%', '%' + cri_categoria + '%').order("date DESC")
  end
end
