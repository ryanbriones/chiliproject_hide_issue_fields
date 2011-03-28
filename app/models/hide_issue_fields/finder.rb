class HideIssueFields::Finder < ActiveRecord::Base
  set_table_name :hide_issue_fields_finders
  
  validates_presence_of :name, :finder
end
