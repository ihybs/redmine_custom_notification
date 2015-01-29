class CustomNotificationTemplate < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :project
  belongs_to :tracker
  serialize :field_names

  # safe_attributes 'tracker_id', 'name', 'to_users', 'cc_users', 'bcc_users', 'field_names'
end
