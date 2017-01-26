//
//  LoginRequest.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class LoginRequest: NetworkRequest {
    
    static let shared = LoginRequest()
    
    override init() { }
    
    
    // login user
    func logInUser(email: String, password: String, isRemind: Bool, completion: @escaping (_ success: Bool, _ message: String) -> ()) {
        self.url = Constants.WebService.UrlLogin
        
        // define parameters
        self.parameters = [
            "email": email,
            "password": password
        ]
        
        self.request { (response, error) in
            if error == nil {
                if let data = response?.data {
                    let json = JSON(data: data)
                    let statusCode = json["status"].intValue
                    if statusCode == Constants.WebResponceCode.Success {
                        // success login
                        User.initializeUser(json: json, saveToLocal: isRemind)
                        completion(true, "")
                    } else {
                        completion(false, json["message"].stringValue)
                    }
                    
                }
            } else {
                completion(false, error?.localizedDescription ?? "error")
            }
        }
    }
    
    
}
