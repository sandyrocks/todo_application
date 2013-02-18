module ApplicationHelper


	def show_signup_or_signout
		if current_user
		  
		  status=  "<li> <%= link_to 'log out', session_path(session), :method => :delete %></li>"
		else
		  
		end
	end

	def show_task_counts(total, completed, incomplete)
		status = ''
		['total', 'completed', 'incomplete'].each do |task_status|

		  status +="<li>#{task_status.capitalize} Tasks-: #{eval(task_status)} </li><hr>" unless eval("#{task_status}.nil?")
		end
        status
	end


end
