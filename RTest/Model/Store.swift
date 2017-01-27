//
//  Store.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import SwiftyJSON

class Store: Object, Mappable {

    dynamic var id = 0
    dynamic var title: String = ""
    dynamic var des: String = ""
    dynamic var address: String = ""
    dynamic var postCode: String = ""
    dynamic var phoneNumber: String = ""
    dynamic var lat: Double = 0
    dynamic var long: Double = 0
    var storeImage: StoreImage?

    
    /*
 
     "id": 1,
     "title": "Down-sized 4thgeneration leverage",
     "description": "Distinctio voluptas ea aliquid consequatur. Rerum cupiditate earum repudiandae non quis a. Rem omnis iste et est repellat sapiente. Dolorum temporibus eos perspiciatis quo laborum unde soluta.",
     "address": "2755 Raul Estate\nWest Ervin, AZ 14265-2763",
     "postcode": "42503-7193",
     "phoneNumber": "387-842-0455x71431",
     "latitude": "-60.964344",
     "longitude": "-12.024244",
     "image": {
     "small": "http://lorempixel.com/200/200/cats/1/",
     "medium": "http://lorempixel.com/400/400/cats/1/",
     "large": "http://lorempixel.com/800/800/cats/1/"
     }
 
 */
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        des <- map["description"]
        address <- map["address"]
        postCode <- map["postcode"]
        phoneNumber <- map["phoneNumber"]
        lat <- map["latitude"]
        long <- map["longitude"]
        storeImage <- map["image"]
    }
    
    class func initializeStoreList(json: JSON, completion:()->()) {
        let storeJsonArray = json["data"].arrayValue
        for storeJson in storeJsonArray {
            if let store = Mapper<Store>().map(JSONObject: storeJson.rawValue) {
                ApplicationManager.shared.addStore(store: store)
            }
        }
        log.debug("StoreCount: \(ApplicationManager.shared.stores.count)")
        completion()
    }

}





