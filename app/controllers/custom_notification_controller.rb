# coding: utf-8
class CustomNotificationController < ApplicationController
  unloadable

  def new
    @issue = Issue.find(params[:issue_id])
    @notification_template = CustomNotificationTemplate.new
    @notification_templates = CustomNotificationTemplate.all
  end

  def send_mail
    @issue = Issue.find(params[:issue_id])
    @notification_template = CustomNotificationTemplate.find(params[:custom_notification_template][:selected_notification_template])
    CustomNotificationMailer.deliver_issue_by_template(@issue, @notification_template)
  end
end
