//
//  CityEndPoint.swift
//  AenneForUser
//
//  Created by Mac on 1/20/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya

enum GetDisablitiesPoint
{
    case Disability
}

extension GetDisablitiesPoint: TargetType
{
    var baseURL: URL {
        switch self{
        case.Disability:
            return URL(string:NetworkManager.basic.baseUrl)!
            
        }
    }
    
    var path: String {
        switch self{
        case.Disability:
            return NetworkManager.Pathes.getDisabilities
        }
    }
    
    var method: Moya.Method {
        switch self{
        case.Disability:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
    
    var task: Task {
        switch self{
        case.Disability:
            
            return .requestPlain
            
            
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case.Disability:
             return ["Content-Type": "application/json"]
        }
    }
    
    
}
