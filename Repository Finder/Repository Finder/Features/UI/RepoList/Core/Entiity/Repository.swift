//
//  Repository.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let id: Int?
    let name: String?
    let owner: Owner?
    let description: String?
    let forksURL: String?
    let forks : Int?
    let watchers: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case forksURL = "forks_url"
        case forks
        case watchers
    
    }
}

