//
//  GetAreaEndPoint.swift
//  AenneForUser
//
//  Created by Mac on 1/22/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya

enum GetAreaEndPoint
{
    case GetArea(cityId:Int)
}

extension GetAreaEndPoint :TargetType
{
    var baseURL: URL {
         switch  self {
         case .GetArea:
           guard let url = URL(string:NetworkManager.basic.baseUrl) else {fatalError("baseURL not configuard")}
            return url
        }
    }
    
    var path: String {
        switch self{
        case .GetArea:
            return NetworkManager.Pathes.getAreaByCity
        }
    }
    
    var method: Moya.Method {
         switch self{
               case .GetArea:
                return .get
            
               }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var Parameters:[String:Any]?
    {
        switch  self {
        case .GetArea(let cityId):
            var param : [String:Any] = [:]
            param = ["cityid":cityId]
            return param
       }
    }
    
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
        
    }
    
    var task: Task {
         switch self{
               case .GetArea:
             return .requestParameters(parameters: Parameters!, encoding: parameterEncoding)
               }
        
    }
    
    var headers: [String : String]? {
        switch self {
        case .GetArea:
            return ["Content-Type": "application/json"]
        }
        
    }
    
    
}
