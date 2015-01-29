# coding: utf-8
class CustomNotificationController < ApplicationController
  unloadable
  before_filter :require_login
  before_filter :find_issue
  before_filter :find_templates, :only => [:new, :select]

  def new
    @notification_template = CustomNotificationTemplate.new
  end

  # Refresh template's preview values when user selects it. (called by Ajax)
  def select
    if params[:custom_notification_template_id].present?
      @notification_template = CustomNotificationTemplate.find(params[:custom_notification_template_id])
      @notification_template.set_issue(@issue)
    else
      @notification_template = CustomNotificationTemplate.new
    end
  end

  def send_mail
    @notification_template = CustomNotificationTemplate.find(params[:custom_notification_template][:selected_notification_template])
    CustomNotificationMailer.deliver_issue_by_template(@issue, @notification_template)
  end

  private

  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

  def find_templates
    @notification_templates = CustomNotificationTemplate.where('project_id = ? AND tracker_id = ?',
                                                               @issue.project.id, @issue.tracker.id).order('name')
  end
end
