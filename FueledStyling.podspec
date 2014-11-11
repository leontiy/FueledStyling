#
# Be sure to run `pod lib lint FueledStyling.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FueledStyling"
  s.version          = "0.1.0"
  s.summary          = "FueledStyling is a set of categories for various controls introducing advanced styling properties and support for Classy."
  s.description      = <<-DESC
                       An optional longer description of FueledStyling might find its way here some day.
                       DESC
  s.homepage         = "https://github.com/leontiy/FueledStyling"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Leonty Deriglazov | Fueled" => "leonty@fueled.com" }
  s.source           = { :git => "https://github.com/leontiy/FueledStyling.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  # s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'FueledStyling' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Classy', '~> 0.2'

  s.subspec "UILabel" do |sp|
    sp.source_files = "Classes/UILabel/*.{h,m}"
  end

  s.subspec "HMSegmentedControl" do |sp|
    sp.source_files = "Classes/HMSegmentedControl/*.{h,m}"
    sp.dependency 'HMSegmentedControl', :git => "https://github.com/leontiy/HMSegmentedControl"
  end

end
