module HideIssueFields
  class Hooks < Redmine::Hook::ViewListener
    def view_issues_form_attributes_top(context)
      hidden_fields = HideIssueFields::HiddenField.find_all_by_project_id_and_tracker_id(context[:issue].project,
                                                                                                  context[:issue].tracker)
      
      context[:hidden_fields] = hidden_fields
      context[:controller].send(:render_to_string, {
                                  :partial => "hooks/hide_issue_fields_hider",
                                  :locals => context })
    end

    def view_layouts_base_html_head(context)
      stylesheet_link_tag :admin, :plugin => "chiliproject_hide_issue_fields"
    end
  end
end
