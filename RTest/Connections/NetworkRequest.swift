//
//  NetworkRequest.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum NetworkRequestType {
    case GET, POST
}

typealias CompletionHandler = (_ response: DataResponse<Any>?, _ error: Error?) -> Void

class NetworkRequest: NSObject {
    
    var parameters: [String: Any]?
    var url: String = ""
    var networkRequestType = NetworkRequestType.POST
    var headers: HTTPHeaders = [
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    
    func request(completion: @escaping CompletionHandler) {
        switch networkRequestType {
        case .GET:
            log.debug("Send get request")
            if Reachability.isInternetAvailable() {
                NetworkActivityIndicatorManager.networkOperationStarted()
                sendGetRequest(completion: { (response, error) in
                    NetworkActivityIndicatorManager.networkOperationFinished()
                    completion(response, error)
                })
            } else {
                completion(nil, ApplicationError().internetConnectionError())
            }

            
        case .POST:
            log.debug("Send post request")
            if Reachability.isInternetAvailable() {
                NetworkActivityIndicatorManager.networkOperationStarted()
                sendPostRequest(completion: { (response, error) in
                    NetworkActivityIndicatorManager.networkOperationFinished()
                    completion(response, error)
                })
            } else {
                completion(nil, ApplicationError().internetConnectionError())
            }
        }
    }
    
    func sendPostRequest(completion: @escaping CompletionHandler) {
        Alamofire.request(self.url, method: .post, parameters: parameters, encoding: URLEncoding(destination: .methodDependent), headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                completion(response, nil)
            case .failure(let error):
                log.error(error)
                completion(response, error)
            }
        }
    }
    
    func sendGetRequest(completion: @escaping CompletionHandler) {
        Alamofire.request(self.url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .methodDependent), headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                completion(response, nil)
            case .failure(let error):
                log.error(error)
                completion(response, error)
            }
        }
    }
    
    
    
}

struct ApplicationError {
    
    func internetConnectionError() -> NSError {
        let userInfo: [String: String] = [
            NSLocalizedDescriptionKey: NSLocalizedString("internet_connection_error", comment: ""),
            NSLocalizedFailureReasonErrorKey: NSLocalizedString("internet_connection_error", comment: "")
        ]
        return NSError(domain: "RTest", code: 5000, userInfo: userInfo)
    }
    
}

