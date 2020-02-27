//
//  AceOfSpade+UIBezierPath.swift
//  AceOfSpadeApp
//
//  Created by giordano scalzo on 27/02/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import SwiftUI

extension UIBezierPath {
    static var spade: UIBezierPath {
        let rightPath = UIBezierPath()

        rightPath.move(to: CGPoint(x: 0.472915, y: 0.13958))
        rightPath.addCurve(to: CGPoint(x: 0.61041, y: 0.2895), controlPoint1: CGPoint(x: 0.517625, y: 0.199208), controlPoint2: CGPoint(x: 0.55625, y: 0.24375))
        rightPath.addCurve(to: CGPoint(x: 0.72708, y: 0.40625), controlPoint1: CGPoint(x: 0.69095, y: 0.35775), controlPoint2: CGPoint(x: 0.70208, y: 0.36875))
        rightPath.addCurve(to: CGPoint(x: 0.76041, y: 0.51458), controlPoint1: CGPoint(x: 0.76933, y: 0.46962), controlPoint2: CGPoint(x: 0.76041, y: 0.51458))
        rightPath.addCurve(to: CGPoint(x: 0.64791, y: 0.64375), controlPoint1: CGPoint(x: 0.76041, y: 0.51458), controlPoint2: CGPoint(x: 0.76041, y: 0.62291))
        rightPath.addCurve(to: CGPoint(x: 0.49375, y: 0.58125), controlPoint1: CGPoint(x: 0.53541, y: 0.66458), controlPoint2: CGPoint(x: 0.49375, y: 0.58125))
        rightPath.addCurve(to: CGPoint(x: 0.52808, y: 0.738375), controlPoint1: CGPoint(x: 0.49375, y: 0.58125), controlPoint2: CGPoint(x: 0.491625, y: 0.679))
        rightPath.addCurve(to: CGPoint(x: 0.57525, y: 0.79475), controlPoint1: CGPoint(x: 0.54075, y: 0.759046), controlPoint2: CGPoint(x: 0.55799, y: 0.782))
        rightPath.addCurve(to: CGPoint(x: 0.63958, y: 0.82291), controlPoint1: CGPoint(x: 0.60758, y: 0.81866), controlPoint2: CGPoint(x: 0.63958, y: 0.82291))
        rightPath.addLine(to: CGPoint(x: 0.472915, y: 0.82291))
        rightPath.close()

        let leftPath = UIBezierPath()
        leftPath.move(to: CGPoint(x: 0.472915, y: 0.139584))
        leftPath.addCurve(to: CGPoint(x: 0.335414, y: 0.2895), controlPoint1: CGPoint(x: 0.42820, y: 0.199208), controlPoint2: CGPoint(x: 0.389584, y: 0.24375))
        leftPath.addCurve(to: CGPoint(x: 0.21875, y: 0.40625), controlPoint1: CGPoint(x: 0.254875, y: 0.35775), controlPoint2: CGPoint(x: 0.24375, y: 0.36875))
        leftPath.addCurve(to: CGPoint(x: 0.185416, y: 0.51458), controlPoint1: CGPoint(x: 0.1765, y: 0.46962), controlPoint2: CGPoint(x: 0.185416, y: 0.51458))
        leftPath.addCurve(to: CGPoint(x: 0.297916, y: 0.64375), controlPoint1: CGPoint(x: 0.185416, y: 0.51458), controlPoint2: CGPoint(x: 0.185416, y: 0.62291))
        leftPath.addCurve(to: CGPoint(x: 0.452084, y: 0.58125), controlPoint1: CGPoint(x: 0.410415, y: 0.66458), controlPoint2: CGPoint(x: 0.452084, y: 0.58125))
        leftPath.addCurve(to: CGPoint(x: 0.41775, y: 0.738375), controlPoint1: CGPoint(x: 0.452084, y: 0.58125), controlPoint2: CGPoint(x: 0.45420, y: 0.679))
        leftPath.addCurve(to: CGPoint(x: 0.37058, y: 0.79475), controlPoint1: CGPoint(x: 0.405083, y: 0.759046), controlPoint2: CGPoint(x: 0.38783, y: 0.782))
        leftPath.addCurve(to: CGPoint(x: 0.30625, y: 0.82291), controlPoint1: CGPoint(x: 0.33825, y: 0.81866), controlPoint2: CGPoint(x: 0.30625, y: 0.82291))
        leftPath.addLine(to: CGPoint(x: 0.472915, y: 0.82291))        
        leftPath.close()

        let path = UIBezierPath()
        path.append(rightPath)
        path.append(leftPath)
        return path
    }
}
