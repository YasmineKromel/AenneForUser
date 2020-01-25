//
//  APIs Calls.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import Moya



class APIsCall
{
    
    // Moya provider
   static  var SignInProvider = MoyaProvider<SignInPoint>()
    
    static func UserSignIn(_ Num:String ,_ Pass: String,_ viewController:UIViewController )
       {
       
           SignInProvider.request(.SignIn(mobile: Num, password: Pass)){ (result) in
               
               
               switch result{
               case .success(let response):
                   
                let data = response.data
                              
                 if let json = try? JSONDecoder().decode(SignInResponse.self, from:data)
                   {
                      print (json)
                       viewController.AlretPopUp (title:"Success" , message:"Sucessful login")
                   }
                   else{
                                 
                   viewController.AlretPopUp (title:"Failed" , message:"Fail to login")
                    }
             
               case .failure(let error ):
                   print (error)
                   viewController.AlretPopUp (title:"Failed" , message:error as! String)
               }
               
             }
           }
    // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
    
      static var CreateShortNewUserProvider = MoyaProvider<createShortNewUserPoint>()
        
      static func  CreateUserShort(_ name:String, _ mobile:String , _ password:String ,_ viewController:UIViewController)
        {
            CreateShortNewUserProvider.request(.NewUserShort(name: name, mobile: mobile, password: password)) { (result) in
                switch result
                {
                    case .failure(let error):
                            print(error)
                     viewController.AlretPopUp(title: "Failed", message: "User Not created  ")
                case.success(let response):
                    print (response)
                    viewController.AlretPopUp(title: "Success", message: "User created sucessfully ")
            }

        }
    }
      // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      static  var GetDisablitiesProvider = MoyaProvider<GetDisablitiesPoint>()
      static var disablity_types:[DisablityResponse] = []
        
    static func GetDisablities(_ viewController:UIViewController ,completion: @escaping () ->Void)
        {
            GetDisablitiesProvider.request(.Disability) { (result) in
                switch result{
                      case .failure(let error):
                            print(error)
                      case.success(let response):
                        
                        let data = response.data
                      
                         if let json = try? JSONDecoder().decode([DisablityResponse].self, from:data)
                          {
                              disablity_types = json
                              completion()
                              // print (json)
                              // self!.AlretPopUp (title:"Success" , message:"Sucessful login")
                          }
                        else{
                               viewController.AlretPopUp (title:"Failed" , message:"Fail get disabilites")
                               
                            }
                }
            }
        }
       // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        static var GetCitiesProvider = MoyaProvider<GetCityEndPoint>()
        static func GetCities()
        {
            GetCitiesProvider.request(.City) { (result) in
                switch result
                {
                    case .failure(let error):
                        print(error)
                    case.success(let response):
                                       
                      //  let data = response.data
                        do
                           {
                            let json = try JSONDecoder().decode([CityResponse].self, from: response.data)
                               print (json)
                            }
                       catch(let error){
                               print(error)
                             //self.AlretPopUp (title:"Failed" , message:"Fail get Cities")
                        }
                    
                }
            }
        }
         // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        static var GetGenderProvider = MoyaProvider<GetGenderEndPoint>()
        
         static func GetGender()
           {
            GetGenderProvider.request(.Gender) { (result) in
                   switch result
                   {
                       case .failure(let error):
                           print(error)
                       case.success(let response):
                                          
                         //  let data = response.data
                           do
                              {
                               let json = try JSONDecoder().decode([gender].self, from: response.data)
                                  print (json)
                               }
                          catch(let error){
                                  print(error)
                                //self.AlretPopUp (title:"Failed" , message:"Fail get Cities")
                           }
                       
                   }
               }
           }
    
      // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
      static  var GetAreaProvider = MoyaProvider<GetAreaEndPoint>()
      static  func GetAreaByCityId(CityId:Int)
        {
            GetAreaProvider.request(.GetArea(cityId: CityId)) { (result) in
                switch result
                {
                    case .failure(let error):
                        print(error)
                    case.success(let response):
                                       
                      //  let data = response.data
                        do
                           {
                            let json = try JSONDecoder().decode([Area].self, from: response.data)
                               print (json)
                            }
                       catch(let error){
                               print(error)
                             //self.AlretPopUp (title:"Failed" , message:"Fail get Cities")
                        }
                    
                }
            }
            
        }
        
}
