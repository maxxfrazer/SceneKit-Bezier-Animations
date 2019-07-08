//
//  SCNGeometry+Extensions.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import SceneKit.SCNGeometry

extension SCNGeometry {
	static func line(points: [SCNVector3], isDotted: Bool = false) -> SCNGeometry {
		let src = SCNGeometrySource(vertices: points)
		let pointSize = points.count
		var indices: [UInt32]! = nil
		if isDotted {
			indices = Array(0...UInt32((pointSize) * 2 - 3))
		} else {
			indices = Array(0...((pointSize) * 2 - 3)).map { UInt32(($0 + 1) / 2) }
		}
		let inds = SCNGeometryElement(indices: indices, primitiveType: .line)
		return SCNGeometry(sources: [src], elements: [inds])
	}
}
