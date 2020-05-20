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
    
    func getListAlbum(page : Int, completion: @escaping (Data?, Error?) -> Void) {
        let url = baseApiUrl + "albums?page=\(page)"
        get(url) { (result, error) in
            completion(result, error)
        }
    }
    
    func getListPhoto(page : Int, completion: @escaping (Data?, Error?) -> Void) {
          let url = baseApiUrl + "photos?page=\(page)"
          get(url) { (result, error) in
              completion(result, error)
          }
      }
}
