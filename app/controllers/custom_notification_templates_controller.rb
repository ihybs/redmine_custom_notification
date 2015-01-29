# coding: utf-8
class CustomNotificationTemplatesController < ApplicationController
  unloadable
  before_filter :find_project
  before_filter :find_trackers

  def index
    @custom_notification_templates = CustomNotificationTemplate.all
  end

  def new
    @custom_notification_template = CustomNotificationTemplate.new
  end

  def create
    @custom_notification_template = CustomNotificationTemplate.new(params[:custom_notification_template])
    @custom_notification_template.project = @project
    if @custom_notification_template.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to :action => 'index', :project_id => @project
    end
  end

  def edit
    @custom_notification_template = CustomNotificationTemplate.find(params[:id])
  end

  def update
    @custom_notification_template = CustomNotificationTemplate.find(params[:id])
    if @custom_notification_template.update_attributes(params[:custom_notification_template])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :action => 'index', :project_id => @project
    end
  end

  def destroy
    @custom_notification_template = CustomNotificationTemplate.find(params[:id])
    @custom_notification_template.destroy
    redirect_to :action => 'index', :project_id => @project
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_trackers
    @trackers = @project.trackers.sorted
  end
end
