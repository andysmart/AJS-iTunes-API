Pod::Spec.new do |s|

  s.name         = "AJSITunesAPI"
  s.version      = "0.2.0"
  s.summary      = "API Helper for the iTunes search API, based on AFNetworking and Mantle."
  s.description  = "API Helper for the iTunes search API, based on AFNetworking and Mantle."
  s.homepage     = "https://github.com/andysmart/AJS-iTunes-API"
  s.license      = 'MIT'
  s.author       = { "Andy Smart" => "andy@andysmart.org" }
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.source       = { :git => "https://github.com/andysmart/AJS-iTunes-API.git", :tag => "0.2.0" }
  s.source_files  = 'AJSITunesAPI', 'AJSITunesAPI/**/*.{h,m}'
  s.requires_arc = true
  
  s.dependency 'AFNetworking', '~> 2.0'
  s.dependency 'Mantle', '~> 1.2'
  s.dependency 'ISO8601DateFormatter', '~> 0.6'
end
