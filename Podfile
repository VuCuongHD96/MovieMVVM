# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MovieMVVM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MovieMVVM

  # API
  pod 'Alamofire', '~> 5.0.0-rc.3'
  pod 'ObjectMapper'
  
  # View
  pod 'SkeletonView' 
  pod 'SDWebImage', '~> 5.8.1'
  pod 'SwiftLint'
  pod 'Toast-Swift', '~> 5.0.1'
  pod 'Reusable'
  pod 'Then'
  pod "Pastel"
  pod 'Cosmos', '~> 23.0'

  # Data Base
  pod 'RealmSwift'
  
  pod "PromiseKit"
  
  post_install do |installer|
        installer.pods_project.build_configurations.each do |config|
          config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
  end
  
end
