//
//  ViewController+ARSCNViewDelegate.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import ARKit

extension ViewController: ARSCNViewDelegate {

	func session(_ session: ARSession, didFailWithError error: Error) {
	}

	func sessionWasInterrupted(_ session: ARSession) {
	}

	func sessionInterruptionEnded(_ session: ARSession) {
	}
}
