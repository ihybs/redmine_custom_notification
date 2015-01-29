Rails.application.routes.draw do
  match 'custom_notification/new/:issue_id', :to => 'custom_notification#new'
  match 'custom_notification/send_mail/:issue_id', :to => 'custom_notification#send_mail'
end
