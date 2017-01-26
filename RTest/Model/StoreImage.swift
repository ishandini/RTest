//
//  StoreImage.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import SwiftyJSON

class StoreImage: Object, Mappable {
    
    dynamic var small: String = ""
    dynamic var medium: String = ""
    dynamic var large: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        small <- map["small"]
        medium <- map["medium"]
        large <- map["large"]
    }
    
}
