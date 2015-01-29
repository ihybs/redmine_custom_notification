# coding: utf-8
class CustomNotificationController < ApplicationController
  unloadable
  before_filter :find_issue

  def new
    @notification_template = CustomNotificationTemplate.new
    @notification_templates = CustomNotificationTemplate.all
  end

  def select
    if params[:custom_notification_template_id].present?
      @notification_template = CustomNotificationTemplate.find(params[:custom_notification_template_id])
    else
      @notification_template = CustomNotificationTemplate.new
    end
    @notification_templates = CustomNotificationTemplate.all
  end

  def send_mail
    @notification_template = CustomNotificationTemplate.find(params[:custom_notification_template][:selected_notification_template])
    CustomNotificationMailer.deliver_issue_by_template(@issue, @notification_template)
  end

  private

  def find_issue
    @issue = Issue.find(params[:issue_id])
  end
end
