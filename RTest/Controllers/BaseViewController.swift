//
//  BaseViewController.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/24/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit
import RappleProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    // MARK: Manage HUD
    func startHUDwithLabel(label: String) {
        RappleActivityIndicatorView.startAnimatingWithLabel(label, attributes: RappleModernAttributes)
    }
    
    func stopHud() {
        RappleActivityIndicatorView.stopAnimating()
    }

}
