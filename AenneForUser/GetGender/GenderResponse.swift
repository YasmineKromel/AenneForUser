//
//  GenderResponse.swift
//  AenneForUser
//
//  Created by Mac on 1/22/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation

struct gender : Codable {
    let id : String
    let admins : [String]
    let clients : [String]
    let drivers : [String]
    let gender_Id : Int
    let gender_Name : String

    enum CodingKeys: String, CodingKey {

        case id = "$id"
        case admins = "Admins"
        case clients = "Clients"
        case drivers = "Drivers"
        case gender_Id = "Gender_Id"
        case gender_Name = "Gender_Name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(String.self, forKey: .id) ?? "")
        admins = try (values.decodeIfPresent([String].self, forKey: .admins) ?? [""])
        clients = try (values.decodeIfPresent([String].self, forKey: .clients) ?? [""])
        drivers = try (values.decodeIfPresent([String].self, forKey: .drivers) ?? [""])
        gender_Id = try (values.decodeIfPresent(Int.self, forKey: .gender_Id) ?? 1)
        gender_Name = try (values.decodeIfPresent(String.self, forKey: .gender_Name) ?? "")
    }

}

