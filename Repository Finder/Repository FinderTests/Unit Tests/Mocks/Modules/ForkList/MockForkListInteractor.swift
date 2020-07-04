//
//  MockForkListInteractor.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockForkListInteractor : ForkListPresenterToInteractorDelegate{
   
    var userName = ""
    var repoName = ""
    var page = 0
    var perPageNumber = 0
    var totalForks = 0
    func fetchForksList(userName: String, repoName: String, page: Int, perPageNumber: Int, totalForks: Int) {
        self.userName = userName
        self.repoName = repoName
        self.page = page
        self.perPageNumber = perPageNumber
        self.totalForks = totalForks
    }
    
    
}
