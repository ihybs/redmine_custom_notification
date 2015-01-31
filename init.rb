require 'redmine'
require 'custom_notification/hooks'

Redmine::Plugin.register :redmine_custom_notification do
  name 'Redmine Custom Notification plugin'
  author 'Takumi Endo'
  description 'A plugin for Redmine that sends email using user-specified fields and recipients.' 
  version '0.0.1'
  url 'https://github.com/ihybs/redmine_custom_notification'

  requires_redmine :version_or_higher => '2.4.0'

  project_module :custom_notification do
    permission :manage_custom_notification_templates,
      { :custom_notification_templates => [:index, :new, :create, :edit, :update, :destroy] },
      :require => :member
    permission :send_notification,
      { :custom_notification => [:new, :select, :send_mail] },
      :require => :member
  end

  menu :project_menu, :custom_notification_templates,
    { :controller => 'custom_notification_templates', :action => 'index', :id => nil },
    { :caption => :custom_notification_templates, :after => :new_issue, :param => :project_id }
end
