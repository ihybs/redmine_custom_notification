class NotificationField
  attr_accessor :name, :label

  def initialize(name, label, options = {})
    self.name = name
    self.label = label
  end
end

class CustomNotificationTemplate < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :project
  belongs_to :tracker
  serialize :field_names

  attr_accessor :selected_notification_template, :subject, :body

  def set_issue(issue)
    self.subject = issue.subject
    self.body = issue.description
  end

  def available_fields
    core_notification_fields = tracker.core_fields.map {|field|
      NotificationField.new(field, l("field_#{field}".gsub("_id", "").to_sym))
    }
    custom_notification_fields = (project.all_issue_custom_fields & tracker.custom_fields).map do |field|
      NotificationField.new("cf_#{field.id}", field.name)
    end

    core_notification_fields + custom_notification_fields
  end

  def selected_fields
    []
  end
end
