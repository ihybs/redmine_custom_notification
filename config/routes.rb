Rails.application.routes.draw do
  match 'projects/:project_id/custom_notification_templates/:action', :to => 'custom_notification_templates'
  match 'projects/:project_id/custom_notification_templates/:id/:action', :to => 'custom_notification_templates'
  match 'custom_notification/new/:issue_id', :to => 'custom_notification#new'
  match 'custom_notification/select/:issue_id', :to => 'custom_notification#select'
  match 'custom_notification/send_mail/:issue_id', :to => 'custom_notification#send_mail'
end
