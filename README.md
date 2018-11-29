# SceneKit-Bezier-Animations

I noticed that there was no nice way (to my knowledge) in SceneKit of animating a Node along a curved path.

Include this pod in your project:
`pod 'SCNBezier'`

Using this framework you can animate a Node along a bézier path using the following example code:

```
	let myNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
	let bezPositions = [SCNVector3(-1, 1, 0.01),
						SCNVector3(1, 0.5, 0.4),
						SCNVector3(1.0, -1, 0.1),
						SCNVector3(0.4, -0.5, 0.01)]
	myNode.runAction(SCNAction.moveAlong(points: bezPositions, duration: 3, fps: 12))
```

The animation will use `duration * fps` points to animated between. This does not mean it will not be smooth, it just means it will make the curve out of that many points, so in this example it will use 36 points along the bézier curve.

![Bézier example](https://github.com/maxxfrazer/SceneKit-Bezier-Animations/blob/master/media/bezier-example.gif)