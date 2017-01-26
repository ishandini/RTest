//
//  AlertHelper.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation

import UIKit

class AlertHelper {
    
    var viewController: UIViewController
    
    init(controller: UIViewController) {
        self.viewController = controller
    }
    
    func showOkAlert(body: String) {
        let alert = UIAlertController(title: "RTest", message: body, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
  
}
