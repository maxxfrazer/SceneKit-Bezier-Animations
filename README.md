# SceneKit-Bezier-Animations

Animate a SCNNode along a curved path in SceneKit.


[![Linter Status](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/workflows/linter/badge.svg)](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/actions)
[![Build Status](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/workflows/build/badge.svg)](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/actions)

[![License](https://img.shields.io/github/license/maxxfrazer/SceneKit-Bezier-Animations?color=lightgray)](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/SCNBezier)](https://cocoapods.org/pods/SCNBezier)
[![SwiftPM](https://img.shields.io/github/v/release/maxxfrazer/SceneKit-Bezier-Animations?color=orange&include_prereleases)](https://github.com/apple/swift-package-manager)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org/)

--------
## Installation

### Swift Package Manager
Add the URL of this repository to _Xcode 11_ with minimum version 1.3.0

### Cocoapods

Add the following to your Podfile
`pod 'SCNBezier'`

--------
## Usage

### Animating

Using this framework you can animate a Node along a bézier path using the following example code:

```
let myNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
let bezPositions = [
  SCNVector3(-1, 1, 0.01),
  SCNVector3(1, 0.5, 0.4),
  SCNVector3(1.0, -1, 0.1),
  SCNVector3(0.4, -0.5, 0.01)
]
myNode.runAction(SCNAction.moveAlong(points: bezPositions, duration: 3, fps: 12))
```

The animation will use `duration * fps` points to animated between; this requires type Double, or its TypeAlias TimeInterval.
This does not mean it will not be smooth, it just means it will make the curve out of that many points, so in this example it will use 36 points along the Bézier curve.

### Getting a Bézier curve

The class `SCNBezierPath` can be created if you want to collect n points along a path for positioning objects etc. as such:

```
let path = SCNBezierPath(points: points)
for point in path.getNPoints(count: 20) {
	let newNode = SCNNode(geometry: nodeGeometry)
	newNode.position = point
	parent.addChildNode(newNode)
}
```

### Position on a Bézier curve

If you want to get a point some percentage along the curve, there's a function that makes that easy for you too.
```
let path = SCNBezierPath(points: points)
let quaterWay = path.posAt(time: 0.25) // gets the point 25% along from start to end
```

With points, nodeGeometry and parent being arbitrary values.

--------

![Bézier example](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/blob/master/media/bezier-example.gif)
