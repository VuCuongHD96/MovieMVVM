# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MovieMVVM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MovieMVVM

  # API
  pod 'Alamofire'
  pod 'ObjectMapper'
  
  # View
  pod 'SkeletonView' 
  pod 'SDWebImage'
  pod 'SwiftLint'
  pod 'Toast-Swift'
  pod 'Reusable'
  pod 'Then'
  pod "Pastel"
  pod 'Cosmos'

  # Data Base
  pod 'RealmSwift'
  
  pod "PromiseKit", "~> 6.16.1"
  
  post_install do |installer|
        installer.pods_project.build_configurations.each do |config|
          config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
  end
  
end
