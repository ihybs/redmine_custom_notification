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

  attr_accessor :selected_notification_template, :notification_field_values, :subject, :body

  def set_issue(issue)
    self.subject = issue.subject

    # Retrieve issue field values.
    notification_field_values = {}
    self.field_names.each do |name|
      if m = name.match(/cf_(\d+)/)
        cfv = issue.custom_field_values.find{|v| v.custom_field.id == m[1].to_i}
        notification_field_values[cfv.custom_field.name] = cfv.value unless cfv.nil?
      else
        label = l("field_#{name}".gsub("_id", "").to_sym)
        value = issue.read_attribute(name.to_sym) || ""
        notification_field_values[label] = value
      end
    end
    self.notification_field_values = notification_field_values

    self.subject = "[Template Mail] #{issue.subject}"
    self.body = notification_field_values.map {|k, v| "<#{k}> #{v}" }.join("\n")
  end

  def available_fields
    all_available_fields.reject {|f| (self.field_names || []).include?(f.name) }
  end

  def selected_fields
    all_available_fields.select {|f| (self.field_names || []).include?(f.name) }
  end

  def all_available_fields
    core_notification_fields = tracker.core_fields.map {|field|
      NotificationField.new(field, l("field_#{field}".gsub("_id", "").to_sym))
    }
    custom_notification_fields = (project.all_issue_custom_fields & tracker.custom_fields).map do |field|
      NotificationField.new("cf_#{field.id}", field.name)
    end
    core_notification_fields + custom_notification_fields
  end
end
