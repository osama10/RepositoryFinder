//
//  MockForkListServices.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockForkListServices : ForkListServices{
    var networkManager: NetworkManager
    
    init() {
        self.networkManager = MockNetworkManager()
    }
    func getForksList(userName: String, repositoryName: String, page: Int, perPageNumber: Int, completion: @escaping ForkListCompletion) {
        
    }
    
    
}
