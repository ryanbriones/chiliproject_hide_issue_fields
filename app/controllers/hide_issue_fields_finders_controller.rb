class HideIssueFieldsFindersController < ApplicationController
  unloadable
  
  layout "admin"
  
  before_filter :require_admin

  def index
    @finders = HideIssueFields::Finder.all
  end

  def new
    @finder = HideIssueFields::Finder.new
  end

  def create
    @finder = HideIssueFields::Finder.new(params[:finder])
    
    if @finder.save
      redirect_to hide_issue_fields_finders_path
    else
      render :template => "hide_issue_fields_finders/new"
    end
  end

  def edit
    @finder = HideIssueFields::Finder.first(:conditions => {:id => params[:id]})
  end
  
  def update
    @finder = HideIssueFields::Finder.first(:conditions => {:id => params[:id]})
    
    if @finder.update_attributes(params[:finder])
      redirect_to hide_issue_fields_finders_path
    else
      render :template => "hide_issue_fields_finders/new"
    end
  end
end
