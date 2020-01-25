//
//  CityModel.swift
//  AenneForUser
//
//  Created by Mac on 1/21/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation

struct CityResponse : Codable {
    let id : String
    let areas : [String]
    let clients : [String]
    let drivers : [String]
    let city_Id : Int
    let city_Name : String

    enum CodingKeys: String, CodingKey {

        case id = "$id"
        case areas = "Areas"
        case clients = "Clients"
        case drivers = "Drivers"
        case city_Id = "City_Id"
        case city_Name = "City_Name"
    }

   init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(String.self, forKey: .id) ?? "")
    areas = try (values.decodeIfPresent([String].self, forKey: .areas) ?? [""])
    clients = try (values.decodeIfPresent([String].self, forKey: .clients) ?? [""])
    drivers = try (values.decodeIfPresent([String].self, forKey: .drivers) ?? [""])
    city_Id = try (values.decodeIfPresent(Int.self, forKey: .city_Id) ?? 0)
    city_Name = try (values.decodeIfPresent(String.self, forKey: .city_Name) ?? "")
    }

}
