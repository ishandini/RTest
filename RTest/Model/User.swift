//
//  User.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import SwiftyJSON

class User: Object, Mappable {

    dynamic var id = 0
    dynamic var name: String = ""
    dynamic var email: String = ""
    dynamic var gender: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        gender <- map["gender"]
    }
    
    class func initializeUser(json: JSON, saveToLocal: Bool) {
        if let user = Mapper<User>().map(JSONObject: json["data"].rawValue) {
            // if need to save user in local
            if saveToLocal {
                try! getRealm().write {
                    getRealm().add(user, update: true)
                }
            }
            // we can access user from application manager
            ApplicationManager.shared.appUser = user
        }
    }
    
    // get user if saved in local DB
    class func current() -> User? {
        let users = getRealm().objects(User.self)
        return users.first
    }
    
    // logout user, hmmm... delete all data for now
    class func logoutUser() {
        try! getRealm().write {
            getRealm().deleteAll()
        }
        // remove user reference from application manager
        ApplicationManager.shared.appUser = nil
    }
    
}
