//
//  userPoint.swift
//  AenneForUser
//
//  Created by Yassmen on 1/12/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import  Moya

enum createShortNewUserPoint
{
    case NewUserShort (name:String,mobile:String,password:String)
}

extension createShortNewUserPoint:TargetType
{
    var baseURL: URL {
        switch self {
        case.NewUserShort:
            return URL(string:NetworkManager.basic.baseUrl)!
        }
}

var path: String {
    switch  self {
        case .NewUserShort:
            return NetworkManager.Pathes.createNewUserPathShortCase
        }
}

var method: Moya.Method {
        switch self {
        case .NewUserShort:
            return .post
        }
}

var sampleData: Data {
        return Data()
}
    
var Parameters:[String:Any]?
{
      switch  self {
           case .NewUserShort(let name,let mobile,let password):
               var param : [String:Any] = [:]
               param = ["name":name ,"mobile": mobile,"password":password]
               return param
    }
}
    
var parameterEncoding: ParameterEncoding {
        
        return URLEncoding.queryString       
}

var task: Task {
     switch self {
        case .NewUserShort:
         return .requestParameters(parameters: Parameters!, encoding: parameterEncoding)
        }
        
}

var headers: [String : String]? {
        switch  self {
        case .NewUserShort:
            return ["Content-Type": "application/json"]
        
        }
        
    }
    
    
}
