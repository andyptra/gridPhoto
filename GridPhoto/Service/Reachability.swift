//
//  Reachability.swift
//  GridPhoto
//
//  Created by andyptra on 5/21/20.
//  Copyright © 2020 andyptra. All rights reserved.
//
import Foundation
import Alamofire
struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}
