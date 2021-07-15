import XCTest
@testable import SCNBezier
import SceneKit

internal func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.x - right.x, left.y - right.y, left.z - right.z)
}
internal func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
	return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
internal func * (left: SCNVector3, right: VectorVal) -> SCNVector3 {
	return SCNVector3Make(left.x * right, left.y * right, left.z * right)
}

internal extension SCNVector3 {
	var lengthSquared: Float {
		Float(sqrt(x * x + y * y + z * z))
	}
}

final class SCNBezierTests: XCTestCase {
	func testBasicBezier() throws {
		let bezPositions = [
			SCNVector3(-1, 1, 0.01),
			SCNVector3(1, 0.5, 0.4),
			SCNVector3(1.0, -1, 0.1),
			SCNVector3(0.4, -0.5, 0.01)
		]

		let points = SCNBezierPath(points: bezPositions).getNPoints(count: 100)
		XCTAssertTrue(points.count == 100, "Wrong number of points: \(bezPositions.count)")
		checkPositionsEqual(bezPositions.first!, points.first!)
		checkPositionsEqual(bezPositions.last!, points.last!)
	}

	func testUnevenValue() throws {
		let bezPositions = [
			SCNVector3(-1, 1, 0.01),
			SCNVector3(1, 0.5, 0.4),
			SCNVector3(1.0, -1, 0.1),
			SCNVector3(0.4, -0.5, 0.01)
		]
		let bezPath = SCNBezierPath(points: bezPositions)
		let actions = SCNAction.getActions(path: bezPath, duration: 0.3, fps: 1)
		let actionSequence = SCNAction.sequence(actions)
		XCTAssertTrue(actions.count == 2, "should have at least 2 actions!")
		XCTAssertTrue(actionSequence.duration == 0.3, "Action sequence wrong length: \(actionSequence.duration)")
		XCTAssertTrue(actions.first!.duration == 0, "Action sequence wrong length: \(actions.first!.duration)")
		XCTAssertTrue(actions.last!.duration == 0.3, "Action sequence wrong length: \(actions.last!.duration)")
	}

	func checkPositionsEqual(_ first: SCNVector3, _ second: SCNVector3, prependMessage: String = "") {
		let endDiff = (first - second).lengthSquared
		XCTAssertTrue(endDiff < 1e-5, "\(prependMessage)\nLast point is not correct \(first) vs \(second)")
	}
}
