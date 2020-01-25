//
//  CityModel.swift
//  AenneForUser
//
//  Created by Mac on 1/20/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation

struct DisablityResponse :Codable{
    let  id : String
    let client_Disabilties : [String]
    let disability_Type_Id : Int
    let disability_Type_Name : String
    let disability_Type_Icon : String

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case client_Disabilties = "Client_Disabilties"
        case disability_Type_Id = "Disability_Type_Id"
        case disability_Type_Name = "Disability_Type_Name"
        case disability_Type_Icon = "Disability_Type_Icon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(String.self, forKey: .id) ?? "")
        client_Disabilties = try (values.decodeIfPresent([String].self, forKey: .client_Disabilties) ??  [""])
        disability_Type_Id = try (values.decodeIfPresent(Int.self, forKey: .disability_Type_Id) ?? 0)
        disability_Type_Name = try (values.decodeIfPresent(String.self, forKey: .disability_Type_Name) ?? "")
        disability_Type_Icon = try (values.decodeIfPresent(String.self, forKey: .disability_Type_Icon) ?? "")
    }

}
