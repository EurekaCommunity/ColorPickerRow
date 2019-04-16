Pod::Spec.new do |s|
  s.name = 'ColorPickerRow'
  s.version = '1.3.1'
  s.license = 'MIT'
  s.summary = 'A color picker row for use with the Eureka form library'
  s.homepage = 'https://github.com/EurekaCommunity/ColorPickerRow'
  s.source = { :git => 'https://github.com/EurekaCommunity/ColorPickerRow.git' }
  s.ios.deployment_target = '9.3'
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.source_files = 'ColorPicker/**/*.swift'
  s.swift_version = '4.2'
  s.requires_arc = true
  s.author = "Mark Alldritt"
  s.dependencies = {
  	'Eureka' => '>= 3.0.0', 
  	'UIColor_Hex_Swift' => '>= 3.0.0'
  }
end
