//
//  AreaResponse.swift
//  AenneForUser
//
//  Created by Mac on 1/22/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation

struct Area : Codable {
    let id : String
    let city : String
    let clients : [String]
    let drivers : [String]
    let area_Id : Int
    let area_Name : String
    let city_Id : Int

    enum CodingKeys: String, CodingKey {

        case id = "$id"
        case city = "City"
        case clients = "Clients"
        case drivers = "Drivers"
        case area_Id = "Area_Id"
        case area_Name = "Area_Name"
        case city_Id = "City_Id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(String.self, forKey: .id) ?? "")
        city = try (values.decodeIfPresent(String.self, forKey: .city) ?? "")
        clients = try (values.decodeIfPresent([String].self, forKey: .clients) ?? [""])
        drivers = try (values.decodeIfPresent([String].self, forKey: .drivers) ?? [""])
        area_Id = try (values.decodeIfPresent(Int.self, forKey: .area_Id) ?? 1)
        area_Name = try (values.decodeIfPresent(String.self, forKey: .area_Name) ?? "")
        city_Id = try (values.decodeIfPresent(Int.self, forKey: .city_Id) ?? 1)
    }

}
