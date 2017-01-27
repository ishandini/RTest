//
//  Constant.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct AppObjects {
        static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    }
    
    struct SegueIdentifier {
        static let StoreToDetailsVC = "StoreToDetails"
        static let StoreDetailsToMapVC = "StoreDetailsToMap"
    }
    
    struct ViewControllersIdentifier {
        static let StoreNav = "StoreNav"
        static let LoginNav = "LoginNav"
    }
    
    struct StoryboardIdentifier {
        static let MainBoard = "Main"
    }
    
    struct Identifier {
        static let CellIdentifier = "Cell"
    }
    
    struct WebService {
        private static let BaseUrl = "http://rms-ios-test.herokuapp.com/"
        static let UrlLogin = "\(BaseUrl)login"
        static let UrlStores = "\(BaseUrl)stores"
    }
    
    struct WebResponceCode {
        static let Success = 200
    }
    
}
