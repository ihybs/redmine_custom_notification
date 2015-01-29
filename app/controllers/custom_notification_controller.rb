# coding: utf-8
class CustomNotificationController < ApplicationController
  unloadable

  def new
    # issue = Issue.find(params[:issue_id])
    @notification_template = CustomNotificationTemplate.new
  end

  # issue.rb に send_notification メソッドがある
  def send_mail
    @issue = Issue.find(params[:issue_id])
    @notification_template = CustomNotificationTemplate.new(params[:custom_notification_template])
    CustomNotificationMailer.deliver_issue_by_template(@issue, @notification_template)
  end
end
