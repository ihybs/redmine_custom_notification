class CustomNotificationTemplate < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :project
  belongs_to :tracker
  serialize :field_names

  attr_accessor :selected_notification_template
end
