#
#  Be sure to run `pod spec lint MHImagePicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "MHImagePicker"
  s.version      = "0.0.2"
  s.summary      = "the MusicHome  imagepicker."

  
  s.description  = "the image imagepicker for the MusicHome"
                   

  s.homepage     = "https://github.com/hengyangKing/MHImagePicker"
  

  s.license      = "MIT"
  

  s.author       = { "hengyangKing" => "hengyangKing.yeah.net" }
  
  s.platform     = :ios
  
  s.ios.deployment_target = "8.0"
  

  s.source       = { :git => "https://github.com/hengyangKing/MHImagePicker.git", :tag => "#{s.version}" }


  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.dependency "MHPopupView/MHPopupView"
  s.dependency "KingBaseCategory/NSDate+"
  s.dependency "MHToolMall/MHAVFormatShop" ,("~>0.0.3")
  s.dependency "KingBaseCategory/NSFileManager+"
  s.dependency "KingBaseCategory/UIApplication+"


end
