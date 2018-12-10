//
//  ForkListPresenter.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Repository_Finder

class ForkListPresenterTests: XCTestCase {
    
    var presenter : ForkListPresenter!
    override func setUp() {
        super.setUp()
        presenter = ForkListPresenterImp(view: MockForkListView(), userName: "osama", repoName: "osama", totalForks: 21)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInteractor(){
        let interactor = MockForkListInteractor()
        presenter.interactor  = interactor
        presenter.interactor.fetchForksList(userName: "osama", repoName: "osama", page: 1, perPageNumber: 30, totalForks: 30)
    
        XCTAssert(interactor.userName == "osama", "Interactor Test Failed")
        XCTAssert(interactor.repoName == "osama", "Interactor Test Failed")
        XCTAssert(interactor.page == 1, "Interactor Test Failed")
        XCTAssert(interactor.perPageNumber == 30, "Interactor Test Failed")
        XCTAssert(interactor.totalForks == 30, "Interactor Test Failed")

    }
    
    func testView(){
        let view = MockForkListView()
        presenter = ForkListPresenterImp(view: view, userName: "osama", repoName: "osama", totalForks: 21)
        presenter.view.reloadData()
        presenter.view.showErrorAlert(with: "error", message: "error")
        presenter.view.startAnimatingLoader()
        presenter.view.stopAnimatingLoader()
        
        XCTAssert(view.reoloadDataCalled == true, "view Test Failed")
        XCTAssert(view.title == "error", "view Test Failed")
        XCTAssert(view.message == "error", "view Test Failed")
        XCTAssert(view.startAnimatingLoaderCalled == true, "view Test Failed")
        XCTAssert(view.stopAnimatingLoaderCalled == true, "view Test Failed")
    }
    
}
