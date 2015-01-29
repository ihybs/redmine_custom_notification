# coding: utf-8
module CustomNotification
  class Hooks < Redmine::Hook::ViewListener

    def view_issues_show_description_bottom(context = {})
      context[:controller].send(
        :render_to_string,
        {
          :partial => 'custom_notification/notification_hook'
        }
      )
    end
  end
end
