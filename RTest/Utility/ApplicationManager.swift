//
//  ApplicationManager.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import SwiftyBeaver
import RealmSwift

// Initialize application configuratin in here

let log = SwiftyBeaver.self

func getRealm() -> Realm {
    return try! Realm()
}

class ApplicationManager: NSObject {
    
    static let shared = ApplicationManager()
    
    // user can't be nil for success login
    var appUser: User?
    
    // Store List not saved to local DB, keep in memory
    var stores: [Store] = [Store]()
  
    override init() {
        super.init()
        self.configSwiftyBeaver()
    }
    
    // debug log
    func configSwiftyBeaver() {
        let console = ConsoleDestination() // log to Xcode Console
        log.addDestination(console)
    }
    
    // MARK: Manage appUser
    func setAppUser(user: User?) {
       appUser = user
    }
    
    func removeAppUser() {
        appUser = nil
    }
    
    // MARK: Manage Store Array
    func addStore(store: Store) {
        stores.append(store)
    }
    
    func removeAllStores() {
        stores.removeAll()
    }
    
}
