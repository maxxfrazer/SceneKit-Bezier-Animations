//
//  InterpolatorFunctions.swift
//  SCNBezier
//
//  Created by Max Cobb on 11/10/2018.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import Foundation

public class InterpolatorFunctions {
	public static func bounceOut(tIn: TimeInterval) -> TimeInterval {
		var t = min(max(tIn,0),1)
		if t < (1/2.75) {
			return 7.5625*t*t
		} else if t < (2/2.75) {
			t -= 1.5/2.75
			return 7.5625*t*t + 0.75
		} else if t < (2.5/2.75) {
			t -= (2.25/2.75)
			return 7.5625*t*t + 0.9375
		} else {
			t -= 2.625/2.75
			return 7.5625*t*t + 0.984375
		}
	}

	public static func easeInExpo(tIn: TimeInterval) -> TimeInterval {
		let t = min(max(tIn,0),1)
		return t == 0 ? 0 : pow(2, 10 * (t - 1));
	}
	public static func easeOutExpo(tIn: TimeInterval) -> TimeInterval {
		let t = min(max(tIn,0),1)
		return t == 1 ? 1 : (1 - pow(2, -10 * t));
	}
	public static func easeInOutExpo(tIn: TimeInterval) -> TimeInterval {
		var t = min(max(tIn,0),1)
		if (t==0 || t == 1) { return t }
		t *= 2
		if (t < 1) { return 1/2 * pow(2, 10 * (t - 1)) }
		return 1/2 * (2 - pow(2, -10 * (t - 1)));
	}

}
