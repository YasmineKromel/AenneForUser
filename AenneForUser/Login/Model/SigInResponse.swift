//
//  SigInResponse.swift
//  AenneForUser
//
//  Created by Yassmen on 1/13/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
// MARK: - Welcome
struct SignInResponse: Codable {
    let id: String
    let area, city: JSONNull?
    let clientDisabilties, clientPaymentsMethods, clientReport, clientsFavourites: [JSONAny]
    let gender: JSONNull?
    let emergencys, govermentsClients, longTrips, tripChat: [JSONAny]
    let trips, tripsRates: [JSONAny]
    let clientID: Int
    let clientName, clientKey, clientMobile: String
    let clientEmail, clientRelativeName, clientRelativeMobile: JSONNull?
    let clientJoinDate, clientPassword, clientBirthDate: String
    let clientGender, useAppDisabled, clientCity, clientArea: JSONNull?
    let clientNotes, addmsg, editmsg: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case area = "Area"
        case city = "City"
        case clientDisabilties = "Client_Disabilties"
        case clientPaymentsMethods = "Client_Payments_Methods"
        case clientReport = "Client_Report"
        case clientsFavourites = "Clients_Favourites"
        case gender = "Gender"
        case emergencys = "Emergencys"
        case govermentsClients = "Goverments_Clients"
        case longTrips = "Long_Trips"
        case tripChat = "Trip_Chat"
        case trips = "Trips"
        case tripsRates = "Trips_Rates"
        case clientID = "Client_Id"
        case clientName = "Client_Name"
        case clientKey = "Client_Key"
        case clientMobile = "Client_Mobile"
        case clientEmail = "Client_Email"
        case clientRelativeName = "Client_Relative_Name"
        case clientRelativeMobile = "Client_Relative_Mobile"
        case clientJoinDate = "Client_JoinDate"
        case clientPassword = "Client_Password"
        case clientBirthDate = "Client_BirthDate"
        case clientGender = "Client_Gender"
        case useAppDisabled = "Use_App_Disabled"
        case clientCity = "Client_City"
        case clientArea = "Client_Area"
        case clientNotes = "Client_Notes"
        case addmsg, editmsg
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


//struct SignInResponse:Codable {
//
//    let id: String
//    let Area: Any
//    let City: Any
//    let ClientDisabilties: [Any]
//    let ClientReport: [Any]
//    let ClientsFavourites: [Any]
//    let Gender: Any
//    let Emergencys: [Any]
//    let LongTrips: [Any]
//    let TripChat: [Any]
//    let Trips: [Any]
//    let TripsRates: [Any]
//    let GovermentsClients: [Any]
//    let ClientPaymentsMethods: [Any]
//    let ClientId: Int
//    let ClientName: String
//    let ClientKey: String
//    let ClientMobile: String
//    let ClientEmail: Any
//    let ClientRelativeName: Any
//    let ClientRelativeMobile: Any
//    let ClientJoinDate: Any
//    let ClientPassword: String
//    let ClientBirthDate: Any
//    let ClientGender: Any
//    let UseAppDisabled: Any
//    let ClientCity: Any
//    let ClientArea: Any
//    let ClientNotes: Any
//    let addmsg: Any
//    let editmsg: Any
//
//
//
//    init( from: id: String,
//          Area: Any,
//       City: Any,
//       ClientDisabilties: [Any],
//       ClientReport: [Any],
//       ClientsFavourites: [Any],
//       Gender: Any,
//       Emergencys: [Any],
//       LongTrips: [Any],
//       TripChat: [Any],
//       Trips: [Any],
//       TripsRates: [Any],
//       GovermentsClients: [Any],
//       ClientPaymentsMethods: [Any],
//       ClientId: Int,
//       ClientName: String,
//       ClientKey: String,
//       ClientMobile: String,
//       ClientEmail: Any,
//       ClientRelativeName: Any,
//       ClientRelativeMobile: Any,
//       ClientJoinDate: Any,
//       ClientPassword: String,
//       ClientBirthDate: Any,
//       ClientGender: Any,
//       UseAppDisabled: Any,
//       ClientCity: Any,
//       ClientArea: Any,
//       ClientNotes: Any,
//       addmsg: Any,
//       editmsg: Any
//)  {
//
//    self.id = id
//    self.Area = Area
//    self.City = City
//    self.ClientDisabilties = ClientDisabilties
//    self.ClientReport = ClientReport
//    self.ClientsFavourites = ClientsFavourites
//    self.Gender = Gender
//    self.Emergencys = Emergencys
//    self.LongTrips = LongTrips
//    self.TripChat = TripChat
//    self.Trips = Trips
//    self.TripsRates = TripsRates
//    self.GovermentsClients = GovermentsClients
//    self.ClientPaymentsMethods = ClientPaymentsMethods
//    self.ClientId = ClientId
//    self.ClientName = ClientName
//    self.ClientKey = ClientKey
//    self.ClientMobile = ClientMobile
//    self.ClientEmail = ClientEmail
//    self.ClientRelativeName = ClientRelativeName
//    self.ClientRelativeMobile = ClientRelativeMobile
//    self.ClientJoinDate = ClientJoinDate
//    self.ClientPassword = ClientPassword
//    self.ClientBirthDate = ClientBirthDate
//    self.ClientGender = ClientGender
//    self.UseAppDisabled = UseAppDisabled
//    self.ClientCity = ClientCity
//    self.ClientArea = ClientArea
//    self.ClientNotes = ClientNotes
//    self.addmsg = addmsg
//    self.editmsg = editmsg
//   }
//
//
//
//}
