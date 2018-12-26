//
//  HomeTableView.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/26/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

@IBDesignable class CustomTableView: UIView {
    
    @IBInspectable var shadowColor: UIColor = .lightGray {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}
