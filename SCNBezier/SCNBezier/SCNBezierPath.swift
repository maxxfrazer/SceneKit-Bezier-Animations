//
//  SCNBezierPath.swift
//  SCNBezier
//
//  Created by Max Cobb on 08/10/2018.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import SceneKit

public class SCNBezierPath {
	private let points: [SCNVector3]
	public init(points: [SCNVector3]) {
		self.points = points
	}
	internal func posAt(time: TimeInterval) -> SCNVector3 {
		let t = Float(time)
		if t == 0 {
			return self.points.first!
		} else if t == 1 {
			return self.points.last!
		}
		var tMult = pow(1 - t, Float(points.count - 1))
		let itMult = t / (1 - t)
		return self.points.reduce(SCNVector3Zero) { (res, next) -> SCNVector3 in
			let tmp = res + (next * tMult)
			tMult *= itMult
			return tmp
		}
	}
	internal func getNPoints(n: Int, interpolator: ((TimeInterval) -> TimeInterval)? = nil) -> [SCNVector3] {
		var bezPoints: Array<SCNVector3> = Array(repeating: SCNVector3Zero, count: n)
		for time in 0..<n {
			let tNow = TimeInterval(time) / TimeInterval(n - 1);
			bezPoints[time] = self.posAt(
				time: interpolator == nil ? tNow : interpolator!(tNow)
			)
		}
		return bezPoints
	}
}
