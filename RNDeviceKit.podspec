require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name                = 'RNDeviceKit'
  s.version             = package['version']
  s.summary             = package['description']
  s.description         = package['description']
  s.homepage            = package['homepage']
  s.license             = package['license']
  s.author              = package['author']
  s.source              = { :git => "https://github.com/baygeldin/react-native-device-kit" }
  
  s.platform            = :ios, "8.0"
  
  s.source_files        = "ios/*.{h,m,swift}"
  s.preserve_paths      = "**/*.js", "**/*.d.ts", "**/*.map", "package.json", "LICENSE", "README.md"
  
  s.dependency 'React'
end