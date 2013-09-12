Pod::Spec.new do |s|

  s.name         = "ManagedMappingObject"
  s.version      = "0.0.1"
  s.summary      = "Converting NSManagedObject to NSDictionary (and back again)."
  s.homepage     = "https://github.com/azu/ManagedMappingObject"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "azu" => "info@efcl.info" }
  s.ios.deployment_target = '5.0'
  s.source       = { :git => "https://github.com/azu/ManagedMappingObject.git" }
  s.source_files = 'src/**/*.{h,m}'
  s.framework    = 'CoreData'
  s.requires_arc = true
end
