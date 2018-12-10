//
//  LoginViewPresenterTests.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Repository_Finder

class LoginViewPresenterTests: XCTestCase {
   
    var presenter : LoginViewPresenter!
  
    override func setUp() {
        super.setUp()
        presenter = LoginViewPresenterImp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRouter(){
        let testOwner = Owner(login: "osama", id: 123, avatarURL: "http://www.google.com", publicRepos: 34)
        let router = MockLoginViewRouter(viewType: .search, owner: testOwner)
        
        presenter.router = router
        presenter.router.showRepoListView(with: .search, owner: testOwner)
        XCTAssert(router.viewType == .search, "Router test failed")
        XCTAssert(router.owner.login! == "osama", "Router test failed")

    }
    
    func testInteractor(){
        let interactor = MockLoginViewInteractor()
        presenter.interactor = interactor
        presenter.interactor.makeAuthentication(userName: "osama", password: "abc123")
        XCTAssert(interactor.userName == "osama", "Router test failed")
        XCTAssert(interactor.password == "abc123", "Router test failed")

    }
    
    func testView(){
        let view = MockLoginView()
        presenter.view = view
       
        presenter.view.startAnimatingLoader()
        presenter.view.stopAnimatingLoader()
        presenter.view.emptyTextFields()
        presenter.view.showErrorAlert(with: "Error", message: "Error")
        
        XCTAssert(view.startAnimatingCalled == true, "Start Animating case failed")
        XCTAssert(view.stopAnimatingCalled == true, "Stop Animating case failed")
        XCTAssert(view.emptyTextFieldsCalled == true, "Empty text field case failed")
        XCTAssert(view.errorTitle == "Error", "Error Title case failed")
        XCTAssert(view.errorMessage == "Error", "ErrorMessage case failed")

    }
}
