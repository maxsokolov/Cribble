Pod::Spec.new do |s|
    s.name                  = 'Cribble'
    s.module_name           = 'Cribble'

    s.version               = '1.0.1'

    s.homepage              = 'https://github.com/maxsokolov/Cribble'
    s.summary               = 'Swifty tool for visual testing iPhone and iPad apps'

    s.author                = { 'Max Sokolov' => 'i@maxsokolov.net' }
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.platforms             = { :ios => '8.0' }
    s.ios.deployment_target = '8.0'

    s.source_files          = 'Sources/*.swift'
    s.resource_bundles      = { 
    	'Cribble' => ['Sources/*.{storyboard,png}']
    }
    s.source                = { :git => 'https://github.com/maxsokolov/Cribble.git', :tag => s.version }
end