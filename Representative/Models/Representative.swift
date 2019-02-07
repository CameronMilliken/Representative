//
//  Representative.swift
//  Representative
//
//  Created by Cameron Milliken on 2/7/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    let name: String
    let party: String
    let district: String
    let office: String
    let link: String
}
