Pod::Spec.new do |s|
    s.name                  = 'FlutterProject'
    s.version               = '0.0.1'
    s.summary               = 'Flutter module'
    s.description           = 'Flutter module - my_module'
    s.homepage              = 'https://flutter.dev'
    s.license               = { :type => 'MIT' }
    s.author                = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
    s.source                = { :git => 'https://github.com/X-HH/FlutterProject.git', :tag => s.version }
    s.ios.deployment_target = '8.0'
    s.vendored_frameworks   = 'flutterapp/build_for_ios/*.framework'
    s.source_files = 'flutterapp/build_for_ios/*.{h,m}'
    s.pod_target_xcconfig = { 'VALID_ARCHS[sdk=iphonesimulator*]' => '' }
  end
  