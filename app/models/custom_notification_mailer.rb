# coding: utf-8
class CustomNotificationMailer < Mailer
  layout false

  # Builds a mail for notifying using custom notification template
  def issue_by_template(issue, template)
    template.set_issue(issue)
    @issue_field_values_by_labels = template.notification_field_values

    mail :to => template.to_users.split(",").map{|addr| addr.strip },
      :cc => template.cc_users.split(",").map{|addr| addr.strip },
      :bcc => template.bcc_users.split(",").map{|addr| addr.strip },
      :subject => template.subject
  end

  def self.deliver_issue_by_template(issue, template)
    CustomNotificationMailer.issue_by_template(issue, template).deliver
  end
end
