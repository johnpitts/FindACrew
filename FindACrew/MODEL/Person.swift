//
//  Person.swift
//  FindACrew
//
//  Created by John Pitts on 10/29/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import Foundation

struct Person: Decodable {                        // String, Bool, Int etc... already conform to Codable/Decodable/Encodable
    
    let name: String
    let gender: String
    let birthYear: String                      // doesn't match the JSON on SWAPI api "birth_year", so created CodingKeys enum
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
    }
    
}

struct PersonSearch: Decodable {
    
    var results: [Person]
}
