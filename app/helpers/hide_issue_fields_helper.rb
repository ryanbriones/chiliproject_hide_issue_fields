module HideIssueFieldsHelper
  def project_settings_tabs_with_hide_fields_helper
    tabs = project_settings_tabs
    tabs << {
      :name => "hide_issue_fields",
      :action => :foo,
      :partial => "projects/settings/hide_issue_fields",
      :label => :hide_issue_fields_title
    }
  end
end
