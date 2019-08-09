#
# Be sure to run `pod lib lint KULimitLengthTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KULimitLengthTextField'
  s.version          = '0.1.0'
  s.summary          = 'KULimitLengthTextField可以对输入进行长度限制，并且可以过滤一些特殊字符'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
KULimitLengthTextField可以对输入进行长度限制，并且可以过滤一些特殊字符，且返回事件代理。
                       DESC

  s.homepage         = 'https://github.com/zhmios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhanghaiming' => '1938708066@qq.com' }
  s.source           = { :git => 'https://github.com/zhmios/KULimitLengthTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KULimitLengthTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KULimitLengthTextField' => ['KULimitLengthTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'Masonry','1.1.0'
end
