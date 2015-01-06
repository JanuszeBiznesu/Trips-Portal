class PossessionsController < ApplicationController
	before_action :logged_in_user, only [:create_order, destroy_order]
  	before_action :admin_user,     only: [:activate_order, destroy_active_order]

	def create_order
		copy = Copy.find(params[:id])
    	current_user.borrow(copy)
    	redirect_to book
	end

	def destroy_order
		copy = Copy.find(params[:id])
    	current_user.unborrow(copy)
    	redirect_to book
	end

	def activate_order(order)
		Possessions.find(order).update_attribute(:specified, "active")
	end

	def destroy_active_order(user, order)
		user.destroy_order(user)
	end
end
