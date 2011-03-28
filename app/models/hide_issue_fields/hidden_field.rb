class HideIssueFields::HiddenField < ActiveRecord::Base
  set_table_name "hide_issue_fields_hidden_fields"

  belongs_to :project
  belongs_to :tracker
  belongs_to :finder, :class_name => "HideIssueFields::Finder"
end
