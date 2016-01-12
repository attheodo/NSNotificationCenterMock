Pod::Spec.new do |s|
  s.name             = "NSNotificationCenterMock"
  s.version          = "0.1.0"
  s.summary          = "A short description of NSNotificationCenterMock."

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/NSNotificationCenterMock"
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
