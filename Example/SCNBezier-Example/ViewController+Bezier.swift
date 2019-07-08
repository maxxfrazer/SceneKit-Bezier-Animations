//
//  ViewController+Bezier.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import SceneKit

extension ViewController {

  func addPoints(count: Int) {
		self.bezierPoints = Array(0..<count).map { index -> BezierPoint in
			return BezierPoint(at: SCNVector3(Float(index - (count / 2)) / 4, 0, -1))
		}
		self.bezierPoints.forEach { (node) in
			self.bezierParent.addChildNode(node)
		}
	}

	func getLatestGeometry(count: Int = 100) -> SCNGeometry {
		return self.bezierPoints.getBezierGeometry(with: count)
	}

	@objc func runAnimation() {
		self.goButton.isHidden = true
		self.bezierParent.isHidden = true

    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = true

    let animNode = SCNNode(geometry: SCNSphere(radius: 0.05))
		animNode.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
		animNode.position = bezierPoints.first!.position
		self.sceneView.scene.rootNode.addChildNode(animNode)
		let bezierCurve = bezierPoints.getBezierPath()
		animNode.runAction(SCNAction.sequence([
			SCNAction.moveAlong(path: bezierCurve, duration: 3),
			SCNAction.wait(duration: 1)
		])) {
			animNode.removeFromParentNode()
			DispatchQueue.main.async {
				self.goButton.isHidden = false
        self.sceneView.showsStatistics = false
			}
			self.bezierParent.isHidden = false
		}
	}

}
