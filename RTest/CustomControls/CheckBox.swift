//
//  CheckBox.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/24/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    // Images
    let checkedImage = UIImage(named: "check_box_fill")
    let uncheckedImage = UIImage(named: "check_box_blank")
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }

}
