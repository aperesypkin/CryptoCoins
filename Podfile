# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

use_frameworks!

def common_pods
  pod 'Dip', '~> 7.0.0'
  pod 'SwiftLint', '~> 0.29.0'
  pod 'Kingfisher', '~> 5.0.0'
  pod 'SnapKit', '~> 4.0'
end

target 'Debug' do
  common_pods
end

target 'Production' do
  common_pods
end
