//
//  CustomImageView.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {

    @IBInspectable var cornerRadious: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadious
        }
    }
    
    @IBInspectable var roundImage: Bool = false {
        didSet {
            if roundImage {
                layer.masksToBounds = false
                layer.cornerRadius = layer.bounds.width / 2.0
                clipsToBounds = true
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }


}
