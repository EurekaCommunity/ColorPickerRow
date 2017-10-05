Pod::Spec.new do |s|
  s.name = 'ColorPickerRow'
  s.version = '1.1.0'
  s.license = 'MIT'
  s.summary = 'A color picker row for use with the Eureka form library'
  s.homepage = 'https://github.com/EurekaCommunity/ColorPickerRow'
  s.source = { :git => 'https://github.com/EurekaCommunity/ColorPickerRow.git' }
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.source_files = 'ColorPicker/**/*.swift'
  s.requires_arc = true
  s.author = "Mark Alldritt"
  s.dependencies = {
  	'Eureka', 
	'UIColor_Hex_Swift'
  }
end