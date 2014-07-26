Pod::Spec.new do |s|
  s.name             = "HPPageViewController"
  s.version          = "1.0"
  s.summary          = "Parallel scrolling through view controllers with interval between each view and scrolling navigation titles."
  
  s.description      = "Inspired by Twitter iOS7 app. Parallel scrolling through view controllers with interval between each view and scrolling navigation titles. Also a custom page control that works smoothly. I found it's quite often we need to display parallel structure of views other than hierachical. Twitter achieved this very beautifully. The purpose is to share knowledge about how this effect can be achieved."
  
  
  s.homepage         = "https://github.com/lizixroy/HPPageViewController"
  #s.screenshots     = "https://github.com/lizixroy/HPPageViewController/blob/master/Images/demo.png"
  s.license          = 'MIT'
  s.author           = { "lizixroy" => "lizixuanroy@hotmail.com" }
  s.source           = { :git => "https://github.com/lizixroy/HPPageViewController", :tag => 1.0 }
  s.social_media_url = 'https://twitter.com/royli1004'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  #s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
