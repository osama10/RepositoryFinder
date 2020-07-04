//
//  RepoListInteractorTests.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Repository_Finder
class RepoListInteractorTests: XCTestCase {
    var interactor : RepoListInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = RepoListInteractorImp(repoListServices: MockRepoListServices())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPresenter(){
        let repoListDTO = RepoListDTO(repositories: [], isError: true, errorMessage: "", showMore : false)

        let presenter = MockRepoListPresenter()
        interactor.presenter = presenter
        interactor.presenter.didRepositoriesFetched(repoListDTO: repoListDTO)
        XCTAssert(presenter.repoListDTO.isError == true, "Presenter Test Failed")
        XCTAssert(presenter.repoListDTO.showMore == false, "Presenter Test Failed")
        
    }
    

    
}
