//
//  RepoListPresenterTests.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Repository_Finder

class RepoListPresenterTests: XCTestCase {
    var presenter : RepoListPresenter!
   
    override func setUp() {
        super.setUp()
        self.presenter = RepoListPresenterImp(view: MockRepoListView(), viewType: .search)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testView(){
        let view = MockRepoListView()
        presenter = RepoListPresenterImp(view: view, viewType: .search)
        
        presenter.view.hideSearchBar()
        presenter.view.reloadData()
        presenter.view.scrollTableViewToTop()
        presenter.view.showErrorAlert(with: "error", message: "error")
        presenter.view.showNoResultFoundAlert()
        presenter.view.startAnimatingLoader()
        presenter.view.stopAnimatingLoader()
        
        XCTAssert(view.hideSearchBarCalled == true, "View test failed")
        XCTAssert(view.reoloadDataCalled == true, "View test failed")
        XCTAssert(view.tableViewToTop == true, "View test failed")
        XCTAssert(view.title == "error", "View test failed")
        XCTAssert(view.message == "error", "View test failed")
        XCTAssert(view.noResultFoundCalled == true, "View test failed")
        XCTAssert(view.startAnimatingLoaderCalled == true, "View test failed")
        XCTAssert(view.stopAnimatingLoaderCalled == true, "View test failed")


    }
 
    func testRouter(){
        let router = MockRepoListRouter()
        presenter.router = router
        presenter.router.pushToForkScreen(repository: "repo", owner: OwnerStubs.fakeOwner, totalForks: 30)
        XCTAssert(router.pushToForkScreenCalled == true , "Router Test Failed")

    }
    
    func testInteactor(){
        let interactor = MockRepoListInteractor()
        presenter.interactor = interactor
        
        presenter.interactor.fetchSearchRepositories(queryString: "detail", page: 1, perPageNumber: 30)
        presenter.interactor.fetchUserRepositories(userName: "osama", page: 1, perPageNumber: 30, totalRepo: 30)
        
        XCTAssert(interactor.queryString == "detail", "Interactor Test Failed")
        XCTAssert(interactor.page == 1, "Interactor Test Failed")
        XCTAssert(interactor.perPageNumber == 30 ,  "Interactor Test Failed")
        XCTAssert(interactor.totalRepo == 30, "Interactor Test Failed")
        
    }
    
    func testWillShowMore(){
        presenter.repoListDTO?.showMore = false
        XCTAssert(presenter.willShowMore() == false, "Will show more test failed")
    }
    
    func testGetRepository(){
        let dummyRepo1 = Repository(id: 1, name: "osama1", owner: nil, description: "", forksURL: "", forks: 1, watchers: 1)
        let dummyRepo2 = Repository(id: 2, name: "osama2", owner: nil, description: "", forksURL: "", forks: 1, watchers: 1)
        let dummyRepo3 = Repository(id: 3, name: "osama3", owner: nil, description: "", forksURL: "", forks: 1, watchers: 1)
       
        let repositories = [dummyRepo1, dummyRepo2, dummyRepo3]

        let repoListDTO = RepoListDTO(repositories: repositories, isError: true, errorMessage: "", showMore : false)
        presenter.repoListDTO = repoListDTO
        presenter.repoListDTO?.repositories = repositories

        XCTAssert(presenter.getRepository(at: 0).id! == 1 ,  "Get Repo Test failed")
        XCTAssert(presenter.getRepository(at: 1).id! == 2 , "Get Repo Test failed")
        XCTAssert(presenter.getRepository(at: 2).id! == 3 , "Get Repo Test failed")

        
    }
    
    func testNumberOfRows(){
        let dummyRepo1 = Repository(id: 1, name: "osama1", owner: nil, description: "", forksURL: "", forks: 1, watchers: 1)
        let dummyRepo2 = Repository(id: 2, name: "osama2", owner: nil, description: "", forksURL: "", forks: 1, watchers: 1)
        let dummyRepo3 = Repository(id: 3, name: "osama3", owner: nil, description: "", forksURL: "", forks: 1, watchers: 1)
        
        let repositories = [dummyRepo1, dummyRepo2, dummyRepo3]
        
        let repoListDTO = RepoListDTO(repositories: repositories, isError: true, errorMessage: "", showMore : false)
        presenter.repoListDTO = repoListDTO
        presenter.repoListDTO?.repositories = repositories
        
        XCTAssert(presenter.numberOfRows(section: 0) == 3 ,  "Number of rows Test failed")
     

    }
    
}
