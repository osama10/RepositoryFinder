//
//  RepoListServices.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation


protocol RepoListServices {
    
    var networkManager : NetworkManager{ get }
    func getUserRepositories(userName : String, page : Int , perPageNumber : Int, completion : @escaping UserRepoCompletion )
    func getRepositoriesFromSearch(queryString : String, page : Int , perPageNumber : Int, completion : @escaping SearchRepoCompletion)
}
