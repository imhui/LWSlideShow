Pod::Spec.new do |s|

  s.name         = "LWSlideShow"
  s.version      = "0.0.1"
  s.summary      = "LWSlideShow."
  s.homepage     = "https://github.com/imhui/LWSlideShow"
  s.license      = "MIT"
  s.author       = { "imhui" => "seasonlyh@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/imhui/LWSlideShow.git", :tag => "0.0.1" }
  s.source_files  = "LWSlideShow/LWSlideShow/*.{h,m}"
  s.requires_arc = true
  s.dependency "AFNetworking", ">= 2.0"

end
