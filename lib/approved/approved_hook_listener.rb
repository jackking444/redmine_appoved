require_dependency 'issues_controller'
class ApprovedHookListener < Redmine::Hook::ViewListener
  def view_projects_show_left(context = {})
    return content_tag("p", "Custom content added to the left")
  end

  def view_projects_show_right(context = {})
    return content_tag("p", "Custom content added to the right")
  end
##    render_on :view_issues_form_details_top,
##   :partial => 'issues/view_issues_form_details_top'

    render_on :view_issues_show_description_bottom,
    :partial => 'issues/view_issues_form_details_top'
    
#    render_on :view_issues_show_details_bottom,
#    :partial => 'issues/view_issues_form_details_top'
end
module Approved
    module IssuePatch
	def self.included(base) # :nodoc:
	    base.send(:include, InstanceMethods)
    
	    base.class_eval do
	    alias_method_chain :build_new_issue_from_params, :user_count
    	    end
	end
                      
	    module InstanceMethods
		# Adds a rates tab to the user administration page
		def build_new_issue_from_params_with_user_count
	        build_new_issue_from_params_without_user_count
			if @issue.project.users.count <= 200
    	    		   @available_watchers = (@available_watchers + @issue.project.users.sort).uniq
		        end
 
    		end
	    end
    end    
end