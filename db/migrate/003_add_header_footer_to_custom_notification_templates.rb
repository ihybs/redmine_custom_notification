class AddHeaderFooterToCustomNotificationTemplates < ActiveRecord::Migration
  def self.up
    add_column :custom_notification_templates, :header, :text
    add_column :custom_notification_templates, :footer, :text
  end

  def self.down
    remove_column :custom_notification_templates, :header
    remove_column :custom_notification_templates, :footer
  end
end
