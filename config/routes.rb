ActionController::Routing::Routes.draw do |map|
  map.resources :hide_issue_fields_finders, :path_prefix => "/admin"
  map.hide_issue_fields_update "/hide_issue_fields/:project_id/trackers/:tracker_id",
                               :controller => "hide_issue_fields", :action => "update", :conditions => {:method => :put}
  map.hide_issue_fields_for_tracker "/hide_issue_fields/:project_id/trackers/:tracker_id",
                                    :controller => "hide_issue_fields", :action => "for_tracker", :conditions => {:method => :get}
end
