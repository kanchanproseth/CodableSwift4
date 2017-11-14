//
//  Employee.swift
//  CodableSwift4
//
//  Created by kanchanproseth on 11/14/17.
//  Copyright © 2017 kanchanproseth. All rights reserved.
//

import Foundation

struct Employee: Codable {
    var name: String
    var id: Int
    var favoriteToy: Toy
    
    //for change name of field when it encode to json
    enum CodingKeys: String, CodingKey {
        case id = "employeeId"
        case name
        case gift
    }
}

struct Toy: Codable {
    var name: String
}

extension Employee {
    //custom the endcode result json
    //from :
    //{ "employeeId": 7, "name": "John Appleseed", "favoriteToy": {"name":"Teddy Bear"}}
    //to :
    //{ "employeeId": 7, "name": "John Appleseed", "gift": "Teddy Bear" }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(favoriteToy.name, forKey: .gift)
    }
}

extension Employee {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        let gift = try values.decode(String.self, forKey: .gift)
        favoriteToy = Toy(name: gift)
    }
}
