//
//  ForkListRequest.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct ForkListRequest : DTO{
    let userName : String
    let repoName : String
    let page : String
    let perPageNumber : String
}
