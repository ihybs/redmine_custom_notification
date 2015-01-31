# Redmine Custom Notification Plugin

Plugin to send an email using user-specified issue's field values.  

Japanese version is [here](/README.ja.md)

## Plugin installation

1. Download the plugin (use git clone or download the ZIP file) and copy into your Redmine plugins directory (e.g.   ``/path/to/redmine/plugins`` )
2. Run the migration task (e.g. ``bundle exec rake redmine:plugins:migrate`` ). If the Redmine works in production environment,  ``RAILS_ENV=production`` is necessary.
3. Restart redmine

See also http://www.redmine.org/projects/redmine/wiki/Plugins

## Usage

1. Go to the project's settings page and click on the Modules tab, then enable "Custom notification" module.
2. If "Custom notification" module is enabled, a project menu named "Custom Notification Templates" is shown, click the menu.
3. Create a new custom notification template.
4. Go to an issue page, click the "Email notification".
