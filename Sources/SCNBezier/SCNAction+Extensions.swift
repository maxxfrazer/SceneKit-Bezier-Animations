//
//  SCNAction+Extensions.swift
//  SCNBezier
//
//  Created by Max Cobb on 08/10/2018.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import SceneKit

public extension SCNAction {
	/// Move along a SCNBezierPath
	///
	/// - Parameters:
	///   - path: SCNBezierPath to animate along
	///   - duration: time to travel the entire path
	///   - fps: how frequent the position should be updated (default 30)
	///   - interpolator: time interpolator for easing
	/// - Returns: SCNAction to be applied to a node
	static func moveAlong(
		path: SCNBezierPath, duration: TimeInterval, fps: Int = 30,
		interpolator: ((TimeInterval) -> TimeInterval)? = nil
	) -> SCNAction {
		let actions = SCNAction.getActions(
			path: path, duration: duration, fps: fps,
			interpolator: interpolator
		)
		return SCNAction.sequence(actions)
	}

	internal static func getActions(
		path: SCNBezierPath, duration: TimeInterval, fps: Int = 30,
		interpolator: ((TimeInterval) -> TimeInterval)? = nil
	) -> [SCNAction] {
		let nPoints = path.getNPoints(
			count: max(2, Int(ceil(duration * Double(fps)))), interpolator: interpolator
		)
		let actions = nPoints.enumerated().map { (iterator) -> SCNAction in
			if iterator.offset == 0 {
				// The first action should be instant, making sure the
				// SCNNode is in the starting position
				return SCNAction.move(to: iterator.element, duration: 0)
			}
			// The duration of each actuion should be a fraction of the full duration
			// n points, n - 1 moving actions, so duration / (n - 1)
			let tInt = duration / Double(nPoints.count - 1)
			return SCNAction.move(to: iterator.element, duration: tInt)
		}
		return actions
	}

	/// Move along a Bezier Path represented by a list of SCNVector3
	///
	/// - Parameters:
	///   - path: List of points to for m Bezier Path to animate along
	///   - duration: time to travel the entire path
	///   - fps: how frequent the position should be updated (default 30)
	///   - interpolator: time interpolator for easing (see InterpolatorFunctions)
	/// - Returns: SCNAction to be applied to a node
	class func moveAlong(
		bezier path: [SCNVector3], duration: TimeInterval,
		fps: Int = 30, interpolator: ((TimeInterval) -> TimeInterval)? = nil
	) -> SCNAction {
		return SCNAction.moveAlong(
			path: SCNBezierPath(points: path),
			duration: duration, fps: fps,
			interpolator: interpolator
		)
	}
}
