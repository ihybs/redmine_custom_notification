class CreateCustomNotificationTemplates < ActiveRecord::Migration
  def self.up
    create_table :custom_notification_templates do |t|
      t.column :to_users, :string
      t.column :cc_users, :string
      t.column :bcc_users, :string
      t.column :project_id, :integer, :null => false
      t.column :tracker_id, :integer, :null => false
      t.column :field_names, :text
    end
  end

  def self.down
    drop_table :custom_notification_templates
  end
end
