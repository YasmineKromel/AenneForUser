//
//  GetCityEndPoint.swift
//  AenneForUser
//
//  Created by Mac on 1/21/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya

enum GetCityEndPoint {
    case City
}

extension GetCityEndPoint: TargetType
{
    
    var baseURL: URL {
               switch  self {
               case .City:
                guard let url = URL(string:NetworkManager.basic.baseUrl) else {fatalError("baseURL not configuard")}
                   return url
               }
          
        }
    
  var path: String {
          switch  self {
            case .City:
                return NetworkManager.Pathes.getCities
                     
        }
        
    }
    
   var method: Moya.Method {
          switch  self {
            case .City:
                return .get
            }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
    
    var task: Task {
        switch  self {
        case .City:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .City:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
