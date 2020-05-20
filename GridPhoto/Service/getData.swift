//
//  getData.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation

class GetData: Service {
    static let shared =  GetData()
    
    func getListData(page : Int, completion: @escaping (Data?, Error?) -> Void) {
        let url = baseApiUrl + "albums?page=\(page)"
        get(url) { (result, error) in
            completion(result, error)
        }
    }
}
