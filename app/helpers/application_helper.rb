module ApplicationHelper


	def show_signup_or_signout
		if current_user
		  
		  status=  "<li> <%= link_to 'log out', session_path(session), :method => :delete %></li>"
		else
		  
		end
	end

	def show_task_counts(total, completed, incomplete)

		status ="<li>Total Tasks-: #{total} </li>" unless total.nil? 
        status += "<hr>"
        status += "<li>Complete task #{completed}</li>" unless completed.nil?
        status += "<hr>"
        status += "<li>Incomplete task #{incomplete}</li>" unless incomplete.nil? 
        return status
	end


end
