require "redmine"

require_dependency "hide_issue_fields/hooks"

Redmine::Plugin.register :chiliproject_hide_issue_fields do
  name "Hide Issue Fields"
  author "Ryan Briones"
  url "https://github.com/ryanbriones/chiliproject_hide_issue_fields"
  version "0.1.0"
  description <<-EODESC
     A plugin that allows you to specify Issue form fields to hide per tracker.
     Specifications for hiding are configured via Javascript
  EODESC

  menu(:admin_menu, 
       :hide_issue_fields, 
       {:controller => "hide_issue_fields_finders", :action => "index"}, 
       :caption => :hide_issue_fields_title)
       
  menu(:project_settings_menu,
       :hide_issue_fields,
       {},
       :html => {:partial => "projects/settings/hide_issue_fields"},
       :caption => :hide_issue_fields_title)
end