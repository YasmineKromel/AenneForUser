//
//  GetGenderEndPoint.swift
//  AenneForUser
//
//  Created by Mac on 1/22/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya

enum GetGenderEndPoint {
    case Gender
}

extension GetGenderEndPoint: TargetType
{
    
    var baseURL: URL {
               switch  self {
               case .Gender:
                guard let url = URL(string:NetworkManager.basic.baseUrl) else {fatalError("baseURL not configuard")}
                   return url
               }
          
        }
    
  var path: String {
          switch  self {
            case .Gender:
                return NetworkManager.Pathes.getGender
                     
        }
        
    }
    
   var method: Moya.Method {
          switch  self {
            case .Gender:
                return .get
            }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
    
    var task: Task {
        switch  self {
        case .Gender:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .Gender:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
