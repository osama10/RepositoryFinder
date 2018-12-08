//
//  RepoResult.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
enum RepoListResult{
    case success(Array<Repository>)
    case error(String)
}
