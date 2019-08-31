Pod::Spec.new do |s|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name          = 'SCNBezier'
  s.version       = '1.3.1'
  s.summary       = 'SCNBezier allows users to animate objects along 3D bézier curves.'
  s.description   = <<-DESC
  					SCNBezier allows users to animate objects along bézier curves.
  					Any number of points can be used for the bézier curves, not limited to just quadratic or cubic
                   DESC
  s.social_media_url = 'https://twitter.com/maxxfrazer'
  s.homepage      = 'https://github.com/maxxfrazer/SceneKit-Bezier-Animations'
  s.license       = 'MIT'
  s.author        = 'Max Cobb'
  s.source        = { :git => 'https://github.com/maxxfrazer/SceneKit-Bezier-Animations.git', :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.frameworks    = 'SceneKit'

  s.source_files  = 'Sources/SCNBezier/*.swift'
end
