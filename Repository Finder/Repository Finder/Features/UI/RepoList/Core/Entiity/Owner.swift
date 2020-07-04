//
//  Owner.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation


struct Owner: Codable {
    
    let login: String?
    let id: Int?
    let avatarURL: String?
    let publicRepos : Int?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case publicRepos = "public_repos"
    }
}
