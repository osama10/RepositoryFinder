//
//  LoginViewInteractor.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Repository_Finder
class LoginViewInteractorTests: XCTestCase {
    var interactor : LoginViewInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = LoginViewInteractorImp(loginService: MockLoginServices())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPresenter(){
        let testLoginDTO = LoginDTO(owners: nil, isError: true, errorMessage: "error")
        let presenter = MockLoginViewPresenter()
        interactor.presenter = presenter
        interactor.presenter.didAuthenticated(loginDTO: testLoginDTO)
        
        XCTAssert(presenter.loginDTO.owners == nil, "interactor test failed")
        XCTAssert(presenter.loginDTO.isError == true, "interactor test failed")
        XCTAssert(presenter.loginDTO.errorMessage == "error", "interactor test failed")

    }
    
    
}
