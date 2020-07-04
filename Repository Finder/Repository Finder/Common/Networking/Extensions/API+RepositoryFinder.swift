//
//  API+Extensions.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

extension API {
    static let repositories = API(baseURL: .baseURL, path: ["search", "repositories"])
    static var userRepositories = API(baseURL: .baseURL)
    static let userAuthentication = API(baseURL: .baseURL, path: ["user"])
    static let forks = API(baseURL: .baseURL)
}
