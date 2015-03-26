Redmine::Plugin.register :approved do
  name 'Approved plugin'
  author 'Evgenii Sitnikov'
  description 'approval workflow'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
#Rails.application.config.to_prepare do
#   IssuesController.send(:include, approved::ControllerPatch)
#end
require_dependency 'approved/approved_hook_listener'

Rails.application.config.to_prepare do
  IssuesController.send(:include, Approved::IssuePatch)
  end