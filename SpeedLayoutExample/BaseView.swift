//
//  BaseView.swift
//  SpeedLayoutExample
//
//  Created by Maxim Vingalov on 26.09.17.
//  Copyright © 2017 Maxim Vingalov. All rights reserved.
//

import UIKit

class BaseView: UIView {
    fileprivate (set) var topLayoutGuide: CGFloat = 0
    fileprivate (set) var bottomLayoutGuide: CGFloat = 0
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayoutGuides(top: CGFloat, bottom: CGFloat) {
        var didChange = false
        
        if top != topLayoutGuide {
            topLayoutGuide = top
            didChange = true
        }
        
        if bottom != bottomLayoutGuide {
            bottomLayoutGuide = bottom
            didChange = true
        }
        
        if didChange {
            didChangeLayoutGuides()
        }
    }
    
    func didChangeLayoutGuides() {
        setNeedsLayout()
    }
}
