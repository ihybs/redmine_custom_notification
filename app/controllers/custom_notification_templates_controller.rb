# coding: utf-8
class CustomNotificationTemplatesController < ApplicationController
  unloadable
  before_filter :require_login
  before_filter :find_project, :authorize
  before_filter :find_trackers, :except => [:index, :destroy]
  before_filter :find_template, :only => [:edit, :update, :destroy]
  before_filter :build_template, :only => [:new, :create]

  def index
    @custom_notification_templates = CustomNotificationTemplate.all
  end

  def new
  end

  def create
    if @custom_notification_template.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to :action => 'index', :project_id => @project
    end
  end

  def edit
  end

  def update
    if @custom_notification_template.update_attributes(params[:custom_notification_template])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :action => 'index', :project_id => @project, :id => nil
    else
      render :edit
    end
  end

  # Update available/selectable field names (called by Ajax).
  def update_form
    if params[:id].present?
      @custom_notification_template = CustomNotificationTemplate.find(params[:id])
    else
      @custom_notification_template = CustomNotificationTemplate.new
    end
    @custom_notification_template.project = @project
    @custom_notification_template.tracker = Tracker.find(params[:tracker_id])
  end

  def destroy
    @custom_notification_template.destroy
    redirect_to :action => 'index', :project_id => @project, :id => nil
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_trackers
    @trackers = @project.trackers.sorted
  end

  def find_template
    @custom_notification_template = CustomNotificationTemplate.find(params[:id])
  end

  def build_template
    @custom_notification_template = CustomNotificationTemplate.new(params[:custom_notification_template])
    @custom_notification_template.project = @project
    @custom_notification_template.tracker = @project.trackers.first
  end
end
