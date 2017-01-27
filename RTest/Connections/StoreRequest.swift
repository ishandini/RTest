//
//  StoreRequest.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/26/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class StoreRequest: NetworkRequest {
  
    static let shared = StoreRequest()
    
    override init() { }
    
    func fetchStoreData(completion: @escaping (_ success: Bool, _ message: String) -> ()) {
        
        self.url = Constants.WebService.UrlStores
        self.networkRequestType = .GET
        
        self.request { (response, error) in
            if error == nil {
                if let data = response?.data {
                    let json = JSON(data: data)
                    let statusCode = json["status"].intValue
                    if statusCode == Constants.WebResponceCode.Success {
                        // success
                        Store.initializeStoreList(json: json, completion: { 
                            completion(true, "")
                        })
                        
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
