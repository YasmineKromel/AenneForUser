//
//  Constants.swift
//  AenneForUser
//
//  Created by Yassmen on 1/9/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation


struct NetworkManager
{
    
    struct basic {
        static var baseUrl = "http://aenee.app.192-185-7-211.hgws27.hgwin.temp.domains/api/"
    }
    
 
    struct Pathes
    {
        static var signInPath = "ClientLogin/Login"
        static var createNewUserPathShortCase = "ClientRegsister/Regsister"
        static var getDisabilities = "Disability_Types"
        static var getCities = "Cities"
        static var getGender = "Genders"
        static var getAreaByCity = "AreasByCity"
        static var SaveLongRegisterUser = "Clients"
        
        
    }

}

