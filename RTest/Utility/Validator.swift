//
//  Validator.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation


enum ValidaterError: Error {
    case invalidData(String)
}

class Validator {
    
    static let shared = Validator()
    
    func validateLogin(email: String, password: String) throws -> (email: String, password: String) {
        // both empty
        guard (email.characters.count > 0) && (password.characters.count > 0) else {
            throw ValidaterError.invalidData(NSLocalizedString("all_fields_are_required", comment: ""))
        }
        // email empty
        guard (email.characters.count > 0) else {
            throw ValidaterError.invalidData(NSLocalizedString("email_required", comment: ""))
        }
        // email Invalid
        guard isValidEmailAddress(email: email) else {
            throw ValidaterError.invalidData(NSLocalizedString("email_not_valid", comment: ""))
        }
        // password empty
        guard (password.characters.count > 0) else {
            throw ValidaterError.invalidData(NSLocalizedString("password_required", comment: ""))
        }
       
        // all are success..
        return (email, password)
    }
    
   
    // Validate email
    func isValidEmailAddress(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: email) {
            return true
        }
        return false
    }
    
    // Error Code
    func messageForErrorCode(errorCode: Int) -> String {
        var message: String = ""
        switch errorCode {
        case 401:
            message = NSLocalizedString("InvalidAPIKey", comment: "")
        case 402:
            message = NSLocalizedString("InvalidLogin", comment: "")
        case 5000:
            message = NSLocalizedString("internet_connection_error", comment: "")
        default:
            message = NSLocalizedString("unknown_error_occured", comment: "")
        }
        return message
    }
    
}

