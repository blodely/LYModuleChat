#
# Be sure to run `pod lib lint LYModuleChat.podspec' to ensure this.
# Created by Luo Yu (indie.luo@gmail.com)
# Friday, December 17, 2021
#

Pod::Spec.new do |s|
  s.name             = 'LYModuleChat'
  s.version          = '0.1.0'
  s.summary          = 'LYModuleChat.'

  s.description      = <<-DESC
LYModuleChat is a chat feature Module.
                       DESC

  s.homepage         = 'https://github.com/blodely/LYModuleChat'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luo Yu' => 'indie.luo@gmail.com' }
  s.source           = { :git => 'https://github.com/blodely/LYModuleChat.git', :tag => s.version.to_s }
  s.social_media_url = 'https://weibo.com/blodely'

  s.ios.deployment_target = '11.0'

  s.source_files = 'LYModuleChat/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYModuleChat' => ['LYModuleChat/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'UIKit'
  
  s.dependency 'LYCategory', '~> 1.13'
  s.dependency 'LYFactAppCommon'
	
  s.dependency 'TXIMSDK_Plus_iOS_Bitcode' # 增强版IM(无UI)
  
#  s.dependency 'TUIChat'
#  s.dependency 'TUIConversation'
#  s.dependency 'TUIContact'
#  s.dependency 'TUIGroup'
#  s.dependency 'TUISearch'
#  s.dependency 'TUICalling'
  
end
