Pod::Spec.new do |s|
  s.name         = "ManagedMappingObject"
  s.version      = "0.1.0"
  s.summary      = "Converting NSManagedObject to NSDictionary (and back again)."
  s.homepage     = "https://github.com/PlusR/ManagedMappingObject"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors       = { "azu" => "info@efcl.info", 'PlusR' => 'sp@plusr.co.jp'}
  s.ios.deployment_target = '6.0'
  s.source       = {
    :git => "https://github.com/PlusR/ManagedMappingObject.git",
    :tag => s.version.to_s
  }
  s.source_files = 'src/**/*.{h,m}'
  s.framework    = 'CoreData'
  s.requires_arc = true
end
