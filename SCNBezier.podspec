Pod::Spec.new do |s|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name          = "SCNBezier"
  s.version       = "1.2.0"
  s.summary       = "SCNBezier allows users to animate objects along 3D bézier curves."
  s.description   = <<-DESC
  					SCNBezier allows users to animate objects along bézier curves.
  					Any number of points can be used for the bézier curves, not limited to just quadratic or cubic
                   DESC
  s.homepage      = "https://github.com/maxxfrazer/SceneKit-Bezier-Animations"
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license       = "MIT"
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author        = "Max Cobb"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source        = { :git => "https://github.com/maxxfrazer/SceneKit-Bezier-Animations.git", :tag => "#{s.version}" }
  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'
  s.frameworks    = 'SceneKit'
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "SCNBezier/*.swift"
end
