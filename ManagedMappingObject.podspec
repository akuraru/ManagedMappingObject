Pod::Spec.new do |s|
  s.name         = "ManagedMappingObject"
  s.version      = "0.2.1"
  s.summary      = "Converting NSManagedObject to NSDictionary (and back again)."
  s.homepage     = "https://github.com/PlusR/ManagedMappingObject"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors       = { "azu" => "info@efcl.info", 'PlusR' => 'sp@plusr.co.jp'}
  s.ios.deployment_target = '6.0'
  s.source       = {
    :git => "https://github.com/PlusR/ManagedMappingObject.git",
    :tag => s.version.to_s
  }
  s.requires_arc = true


  s.subspec 'Core' do |a|
    a.source_files = 'src/MappingService.{h,m}'
  end
  
  s.subspec 'ManagedMappingObject' do |a|
    a.source_files = 'src/ManagedMappingObject.{h,m}'
    a.framework    = 'CoreData'
    a.dependency 'ManagedMappingObject/Core'
  end
end
