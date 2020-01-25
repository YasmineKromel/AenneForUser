//
//  LoginEndPoint.swift
//  AenneForUser
//
//  Created by Yassmen on 1/9/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya


enum SignInPoint
{
    case SignIn(mobile:String,password:String)
    
}

extension SignInPoint: TargetType{
    var baseURL: URL {
        switch  self {
        case .SignIn:
            return URL(string:NetworkManager.basic.baseUrl)!
        
        }
    }
    
    var path: String {
        switch self{
        case .SignIn:
            return NetworkManager.Pathes.signInPath
        }
    }
    
    var method: Moya.Method  {
        switch  self {
        case .SignIn:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var Parameters:[String:Any]?
    {
        switch  self {
        case .SignIn(let Num,let pass):
            var param : [String:Any] = [:]
            param = ["mobile":Num ,"password": pass]
            return param
       }
    }
    
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
        
    }
        
    var task: Task {
        switch self {
        case .SignIn:
           
         // return .requestPlain
            // JSONEncoding.default
            return .requestParameters(parameters: Parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        switch  self {
        case .SignIn:
            return ["Content-Type": "application/json"]
        
        }
    }
    
    
}

