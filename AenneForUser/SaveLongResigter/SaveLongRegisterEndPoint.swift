//
//  SaveLongRegisterEndPoint.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya

enum SaveLongRegisterEndPoint {
    case LongRegister
}

extension SaveLongRegisterEndPoint: TargetType
{
    
    var baseURL: URL {
               switch  self {
               case .LongRegister:
                guard let url = URL(string:NetworkManager.basic.baseUrl) else {fatalError("baseURL not configuard")}
                   return url
               }
          
        }
    
  var path: String {
          switch  self {
            case .LongRegister:
                return NetworkManager.Pathes.SaveLongRegisterUser
                     
        }
        
    }
    
   var method: Moya.Method {
          switch  self {
            case .LongRegister:
                return .get
            }
    }
    
    var sampleData: Data {
        return Data()
    }
    
//    var Parameters:[String:Any]?
//    {
//        switch  self {
//        case .LongRegister(let cityId):
//            var param : [String:Any] = [:]
//            param = ["cityid":cityId]
//            return param
//       }
//    }
    
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
        
    }
    
    var task: Task {
        switch  self {
        case .LongRegister:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .LongRegister:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}

