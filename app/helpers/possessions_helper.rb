module PossessionsHelper

 	def how_many_orders_of(copy)
 		Possession.where(borrowed_id: copy.id).length 
 	end

 	def position_in_line_of(user, copy)
 		orders = Possession.where(borrowed_id: copy.id)
 		increment = 0
 		which = 0
 		for i in orders 
 			increment += 1
 			if (i.borrower_id == user.id)
 				which = increment
 				break
 			end
 		end
 		which
 	end

 	def top_action(copy)
 		top_status = Possession.where(borrowed_id: copy.id).first.specifier
 		if top_status == "active"
 			"Return book"
 		else
 			"Borrow book"
 		end
 	end

end
