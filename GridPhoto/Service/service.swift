//
//  service.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation
import Alamofire

struct ErrorRequestModel : Codable {
    let errorCode: String?
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "code"
        case message = "message"
    }
}

class Service: Any {
    
    let baseApiUrl : String = "https://gorest.co.in/public-api/"
    func get(_ url: String, parameters: Parameters? = nil, completion: @escaping (Data?, Error?) -> Void) {
        
        let gorestToken = "V0NuSXITAnx-zF9Euh7K6no6QsiTHxpoWNeT"
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
            "authorization": "Bearer "+gorestToken]
        
        AF.request(url,method: .get, parameters: parameters, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let value):
                completion(value, nil)
            case .failure(let error):
                if let statusCode = response.response?.statusCode, let data = response.data {
                    #if DEBUG
                    debugPrint("ERROR STATUS CODE \(statusCode) of \(url)")
                    #endif
                    
                    if statusCode == 429 {
                        completion(nil, error)
                        return
                    }
                    
                    do {
                        let decodedData = try JSONDecoder().decode(ErrorRequestModel.self, from: data)
                        completion(nil, NSError(domain: "", code: statusCode, userInfo: [
                            NSLocalizedDescriptionKey:  self.getErrMessage(msg: decodedData.message)
                        ]))
                    } catch {
                        completion(nil, error)
                    }
                } else {
                    completion(nil, error)
                }
            }
        }
    }
    
    func getErrMessage(msg: String) -> String {
        return msg
    }
}
