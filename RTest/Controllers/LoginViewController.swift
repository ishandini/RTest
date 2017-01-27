//
//  LoginViewController.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/24/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnRemind: CheckBox!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // hide navigation from this viewcontroller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: IBAction
    @IBAction func pressedLogin(_ sender: Any) {
        view.endEditing(true)
        
        logUser()
    }
    
    
    // MARK: Supporting Methods
    func logUser() {
        do {
            let credential = try Validator.shared.validateLogin(email: txtEmail.text!.trim(), password: txtPassword.text!)
            // send login request
            self.startHUDwithLabel(label: NSLocalizedString("login", comment: ""))
            LoginRequest.shared.logInUser(email: credential.email, password: credential.password, isRemind: btnRemind.isChecked, completion: { (success, message) in
                self.stopHud()
                if success {
                    // login success,
                    self.moveToStoreView()
                } else {
                    // show user loging error
                    AlertHelper(controller: self).showOkAlert(body: message)
                }
            })
            
        } catch ValidaterError.invalidData(let key) {
            // show user validate error massage
            AlertHelper(controller: self).showOkAlert(body: key)
        } catch {
            log.error(error)
        }
    }
    
    func moveToStoreView() {
        if let storeNav = self.storyboard?.instantiateViewController(withIdentifier: Constants.ViewControllersIdentifier.StoreNav) as? UINavigationController {
            Constants.AppObjects.appDelegate.window?.rootViewController = storeNav
        }
    }
    
    
}
