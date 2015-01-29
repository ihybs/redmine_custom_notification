# coding: utf-8
class CustomNotificationMailer < Mailer
  # Builds a mail for notifying using custom notification template
  def issue_by_template(issue, template)
    @issue_field_values_by_labels = {
      :description => issue.description
    }

    mail :to => template.to_users.split(",").map{|addr| addr.strip },
      :cc => [],
      :subject => "[Template Mail] #{issue.subject}"
  end

  def self.deliver_issue_by_template(issue, template)
    CustomNotificationMailer.issue_by_template(issue, template).deliver
  end
end
