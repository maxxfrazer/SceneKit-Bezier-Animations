//
//  BezierPoint.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import SceneKit
//import SCNBezier

extension Array where Element: BezierPoint {
	func getBezierPath() -> SCNBezierPath {
		let positions = self.map { $0.parent!.convertPosition($0.position, to: nil) }
		return SCNBezierPath(points: positions)
	}
	func getBezierVertices(count: Int = 100) -> [SCNVector3] {
		let bezPath = self.getBezierPath()
		return bezPath.getNPoints(count: count)
	}
	func getBezierGeometry(with count: Int = 100) -> SCNGeometry {
		let points = self.getBezierVertices(count: count)
		return SCNGeometry.line(points: points)
	}
}

class BezierPoint: SCNNode {
	init(at position: SCNVector3) {
		super.init()
		self.geometry = SCNSphere(radius: 0.05)
		self.geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
		self.position = position
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
