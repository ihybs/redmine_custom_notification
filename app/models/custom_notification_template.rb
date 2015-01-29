class CustomNotificationTemplate < ActiveRecord::Base
  belongs_to :project
  belongs_to :tracker
  serialize :field_names
end
