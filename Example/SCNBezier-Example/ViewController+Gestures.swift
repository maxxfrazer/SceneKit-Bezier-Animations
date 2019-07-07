//
//  ViewController+Gestures.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import SceneKit

private func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

extension ViewController: UIGestureRecognizerDelegate {
	func setupGestures() {
		// Pan gesture
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.translateObject(_:)))
		panGesture.delegate = self
		self.view.addGestureRecognizer(panGesture)
		cameraFrameNode.isHidden = true
	}

	@objc func translateObject(_ gestureRecognizer: UIGestureRecognizer) {
		if gestureRecognizer.state == .began {
			let location: CGPoint = gestureRecognizer.location(in: self.sceneView)
			let hits = self.sceneView.hitTest(location, options: [.boundingBoxOnly: true, .rootNode: self.bezierParent]
			)
			if let firstHit = hits.first(where: { $0.node is BezierPoint}),
				let node = firstHit.node as? BezierPoint {
				self.hitNode = node
				lastParent = node.parent
				let cameraCoords = node.parent!.convertPosition(
					node.position, to: self.sceneView.pointOfView
				)
				startPos = cameraCoords
				self.sceneView.pointOfView?.addChildNode(cameraFrameNode)
				cameraFrameNode.position.z = cameraCoords.z
				cameraFrameNode.eulerAngles.x = -.pi / 2
				cameraFrameNode.opacity = 0.1
				self.sceneView.pointOfView?.addChildNode(node)
				node.position = cameraCoords
			}
		} else if self.hitNode == nil || lastParent == nil {
			return
		} else if gestureRecognizer.state == .changed,
			let panGesture = gestureRecognizer as? UIPanGestureRecognizer {
			let lastPoint = panGesture.location(in: self.view)
			let nextPoint = lastPoint + panGesture.translation(in: self.view)
			guard let lastHit = self.sceneView.hitTest(lastPoint, options: [
				SCNHitTestOption.rootNode: cameraFrameNode, SCNHitTestOption.ignoreHiddenNodes: false
			]).first, let currentHit = self.sceneView.hitTest(nextPoint, options: [
				SCNHitTestOption.rootNode: cameraFrameNode, SCNHitTestOption.ignoreHiddenNodes: false
			]).first else {
				return
			}
			self.hitNode?.position.x = startPos!.x + (currentHit.localCoordinates.x - lastHit.localCoordinates.x)
			self.hitNode?.position.y = startPos!.y + (currentHit.localCoordinates.z - lastHit.localCoordinates.z)
		} else if gestureRecognizer.state == .ended, let hitNode = self.hitNode {
			let worldCoords = sceneView.pointOfView!.convertPosition(hitNode.position, to: lastParent)
			lastParent?.addChildNode(hitNode)
			hitNode.position = worldCoords
			self.hitNode = nil
			lastParent = nil
			self.bezierGeometryNode.geometry = self.getLatestGeometry()
			self.bezierGeometryNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
		}
	}
}
