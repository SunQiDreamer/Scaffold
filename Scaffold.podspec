#
# Be sure to run `pod lib lint Scaffold.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Scaffold'
  s.version          = '0.5.1'
  s.summary          = 'A Scaffold.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 ios项目使用的基类脚手架
                       DESC

  s.homepage         = 'https://github.com/SunQiDreamer/Scaffold'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '孙琦' => '993473797@qq.com' }
  s.source           = { :git => 'https://github.com/SunQiDreamer/Scaffold', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Scaffold/Classes/*', 'Scaffold/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Scaffold' => ['Scaffold/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'JXSegmentedView'
  s.dependency 'JXPagingView/Paging' #swift
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'TABAnimated'
  s.dependency 'MJRefresh'
  s.dependency 'DZNEmptyDataSet'
  s.dependency 'TABAnimated'
  s.dependency 'YYCategories'
  s.dependency 'YYCache'
  s.dependency 'SnapKit'
  s.dependency 'lottie-ios', '2.5.3'
  s.dependency 'Masonry'

end
