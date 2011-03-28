class HideIssueFieldsController < ApplicationController
  unloadable
  
  def update
    project = Project.find(params[:project_id])
    tracker = project.trackers.find_by_id(params[:tracker_id])
    hidden_by_this_tracker = HideIssueFields::HiddenField.find_all_by_project_id_and_tracker_id(project, tracker).map(&:finder)

    hidden_by_this_tracker_ids = hidden_by_this_tracker.map(&:id)
    to_hide_param = (params[:hidden_fields].try(:[], :to_hide) || [])
    to_add = to_hide_param.select { |id| !hidden_by_this_tracker_ids.include?(id) }
    to_remove = hidden_by_this_tracker_ids.select { |id| !to_hide_param.include?(id) }
    Rails.logger.debug("***** to_add: #{to_add.inspect}, to_remove: #{to_remove.inspect}")

    to_add.each do |finder_id|
      HideIssueFields::HiddenField.create(:project => project, :tracker => tracker, :finder_id => finder_id)
    end

    to_remove.each do |finder_id|
      hidden_field = HideIssueFields::HiddenField.first(:conditions => {:project_id => project, :tracker_id => tracker, :finder_id => finder_id})
      if hidden_field
        hidden_field.destroy
      end
    end
    
    hidden_by_this_tracker = HideIssueFields::HiddenField.find_all_by_project_id_and_tracker_id(project, tracker).map(&:finder)
    all_finders = HideIssueFields::Finder.all
    available_for_this_tracker = all_finders - hidden_by_this_tracker
    render :partial => "projects/settings/hide_issue_fields_for_tracker", :locals => {:project => project, :tracker => tracker, :available_for_this_tracker => available_for_this_tracker, :hidden_by_this_tracker => hidden_by_this_tracker}
  end
  
  def for_tracker
    project = Project.find(params[:project_id])
    tracker = project.trackers.find_by_id(params[:tracker_id])
    all_finders = HideIssueFields::Finder.all
    hidden_by_this_tracker = HideIssueFields::HiddenField.find_all_by_project_id_and_tracker_id(project, tracker).map(&:finder)
    available_for_this_tracker = all_finders - hidden_by_this_tracker

    render :partial => "projects/settings/hide_issue_fields_for_tracker", :locals => {:project => project, :tracker => tracker, :available_for_this_tracker => available_for_this_tracker, :hidden_by_this_tracker => hidden_by_this_tracker}
  end
end
