//
//  SCNAction+Extensions.swift
//  SCNBezier
//
//  Created by Max Cobb on 08/10/2018.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import SceneKit

public extension SCNAction {
	class func moveAlong(path: SCNBezierPath, duration: TimeInterval, fps: Int, interpolator: ((TimeInterval) -> TimeInterval)? = nil) -> SCNAction {
		let actions = path.getNPoints(n: Int(duration) * fps, interpolator: interpolator).map { (point) -> SCNAction in
			let tInt = 1 / TimeInterval(fps)
			return SCNAction.move(to: point, duration: tInt)
		}
		return SCNAction.sequence(actions)
	}
	class func moveAlong(bezier path: [SCNVector3], duration: TimeInterval, fps: Int, interpolator: ((TimeInterval) -> TimeInterval)? = nil) -> SCNAction {
		return SCNAction.moveAlong(path: SCNBezierPath(points: path), duration: duration, fps: fps, interpolator: interpolator)
	}
}
