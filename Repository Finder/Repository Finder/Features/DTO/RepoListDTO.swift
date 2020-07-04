//
//  RepoListDTO.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct RepoListDTO {
    var repositories : [Repository]
    var isError : Bool
    var errorMessage : String
    var showMore : Bool
}
