//
//  WhiteView.swift
//  07.08 토요스터디
//
//  Created by 🦈⛓️🥝🪴 on 2022/07/09.
//

import UIKit

class WhiteView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print(hitTestView.restorationIdentifier!)

                    return hitTestView
                }
            }
            return self
        }
        return nil
    }
}
