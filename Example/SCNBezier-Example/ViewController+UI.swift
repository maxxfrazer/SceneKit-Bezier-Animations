//
//  ViewController+UI.swift
//  SCNBezier-Example
//
//  Created by Max Cobb on 7/6/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import UIKit

extension ViewController {
	func makeGoButton() {
		let frameSize = self.view.bounds.size
		let safeEdges = self.view.safeAreaInsets
		let newButton = UIButton(frame: CGRect(
			x: frameSize.width * 0.1,
			y: frameSize.height - (frameSize.width * 0.8 * 0.3) - safeEdges.bottom,
			width: frameSize.width * 0.8,
			height: frameSize.width * 0.8 * 0.3
		))
		newButton.backgroundColor = .orange
		newButton.setTitle("run action", for: .normal)
		newButton.setTitleColor(UIColor.red, for: .normal)

		// runAnimation defined in ViewController+SCNBezier
		newButton.addTarget(self, action: #selector(runAnimation), for: .touchUpInside)

		self.goButton = newButton
		self.view.addSubview(newButton)
	}
}
