//
//  MockRepoListServices.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockRepoListServices : RepoListServices{
    var networkManager: NetworkManager
    
    init() {
        self.networkManager = MockNetworkManager()
    }
    
    func getUserRepositories(userName: String, page: Int, perPageNumber: Int, completion: @escaping UserRepoCompletion) {
        
    }
    
    func getRepositoriesFromSearch(queryString: String, page: Int, perPageNumber: Int, completion: @escaping SearchRepoCompletion) {
        
    }
    
    
}
