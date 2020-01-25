//
//  PasseDataModelForLongVC.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation

struct PassedData
{
    var name :String
    var mobile :String
    var pass :String
    
    init(name:String,mobile:String,pass:String) {
        self.name = name
        self.mobile = mobile
        self.pass = pass
    }
}
