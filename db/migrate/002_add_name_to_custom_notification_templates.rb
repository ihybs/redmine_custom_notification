class AddNameToCustomNotificationTemplates < ActiveRecord::Migration
  def self.up
    add_column :custom_notification_templates, :name, :string
  end

  def self.down
    remove_column :custom_notification_templates, :name
  end
end
