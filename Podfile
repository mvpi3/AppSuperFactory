source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target "AppFactory" do

# Basic SDK
#pod 'AFNetworking', '~> 4.0'
pod 'ReactiveObjC', '~> 3.0.0'
pod 'PromiseKit', '~> 6.9.0'
pod 'MJExtension', '3.0.13'
pod 'Aspects', '~> 1.4.1'
pod 'Masonry', '~> 0.6.4'
pod 'SVProgressHUD', '2.2.5'
pod 'ObjcAssociatedObjectHelpers', '2.0.1'

# Analytics Tools & SDK
#pod 'FBSDKCoreKit', '~> 13.2.0'
#pod 'FBSDKLoginKit', '~> 13.2.0'

# Image & ImageView & ImagePicker
pod 'SDWebImage', '~> 5.0'

# View
pod 'ViewUtils', '~> 1.1.2'
pod 'MJRefresh', '~> 3.1.4'
pod 'MBProgressHUD', '~> 1.1.0'
pod 'RMessage', '~> 2.1.5'
pod 'DACircularProgress'
pod 'pop'

# Helper
pod 'SAMKeychain', '~> 1.5.2'
pod 'ArrayUtils', '~> 1.3'
pod 'NSHash', '~> 1.2.0' # MD5 [string MD5]
pod 'ActionSheetPicker-3.0', '2.2.0'
pod 'DateTools', '~> 2.0.0'
pod 'hpple', '~> 0.2.0'
pod 'PINCache', '~> 3.0.1-beta.5'
pod 'UIDeviceIdentifier'

end

#
# replace project -> pods_project by https://github.com/CocoaPods/CocoaPods/issues/3918
#
# 64-bit build architecture for all pod targets and override 'Build Active Architecture Only' to NO.
 post_install do |installer|
   installer.pods_project.targets.each do |target|
      target.build_configurations.each do |configuration|
        target.build_settings(configuration.name)['VALID_ARCHS'] = '$(ARCHS_STANDARD)'
        target.build_settings(configuration.name)['ONLY_ACTIVE_ARCH'] = 'NO'
        configuration.build_settings['SWIFT_VERSION'] = '4.0'
        configuration.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
