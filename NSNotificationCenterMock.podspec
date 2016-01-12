Pod::Spec.new do |s|
  s.name             = "NSNotificationCenterMock"
  s.version          = "0.1.0"
  s.summary          = "A simple mock for NSNotificationCenter for easily testing NSNotificationCenter related tasks."

  s.description      = <<-DESC
                        NSNotificationCenter is a class used for mocking NSNotificationCenter. You can use this class to test
                        NSNotification logic in your project such as whether certain NSNotifications were posted, registration/unregistration
                        to/from observers and more.
                       DESC

  s.homepage         = "https://github.com/attheodo/NSNotificationCenterMock"
  s.license          = 'MIT'
  s.author           = { "attheodo" => "at@atworks.gr" }
  s.source           = { :git => "https://github.com/attheodo/NSNotificationCenterMock.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/attheodo'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'NSNotificationCenterMock' => ['Pod/Assets/*.png']
  }


end
