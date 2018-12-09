//
//  RepoListRequest.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct RepoListSearchRequest : DTO{
    let queryString : String
    let pageNumber : String
    let perPageElement : String
}
