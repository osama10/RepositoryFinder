//
//  RepoListUserRequest.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
struct RepoListUserRequest : DTO {
    let userName : String
    let page : String
    let perPageNumber : String
}
