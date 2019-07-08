//
//  ViewController.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import ARKit

class ViewController: UIViewController {

  var sceneView = ARSCNView(frame: .zero)
  var bezierPoints: [BezierPoint] = []
  let bezierParent = SCNNode()
  var goButton: UIButton! = nil
  let bezierGeometryNode = SCNNode()

  // MARK: Gesture Variables
  var lastParent: SCNNode?
  var hitNode: BezierPoint?
  var startPos: SCNVector3?
  var cameraFrameNode = SCNNode(geometry: SCNFloor())

  override func viewDidLoad() {
    super.viewDidLoad()

    self.sceneView.frame = self.view.bounds
    self.view.addSubview(self.sceneView)

    // Set the view's delegate
    self.sceneView.delegate = self

    self.setupGestures()
    self.makeGoButton()
    self.addPoints(count: 4)
    self.sceneView.scene.rootNode.addChildNode(self.bezierGeometryNode)
    self.sceneView.scene.rootNode.addChildNode(self.bezierParent)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Create a session configuration
    let configuration = ARWorldTrackingConfiguration()

    // Run the view's session
    sceneView.session.run(configuration)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    // Pause the view's session
    sceneView.session.pause()
  }
}
