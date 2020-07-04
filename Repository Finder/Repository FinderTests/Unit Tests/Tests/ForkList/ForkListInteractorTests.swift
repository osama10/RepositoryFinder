//
//  ForkListInteractor.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import XCTest
@testable import Repository_Finder

class ForkListInteractorTests: XCTestCase {
    var interactor : ForkListInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = ForkListInteractorImp(forkListServices: MockForkListServices())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPresenter(){
        let forListDTO = ForkListDTO(owners: [], isError: true, errorMessage: "error", showMore: true)
        let presenter = MockForkListPresenter()
        interactor.presenter = presenter
        interactor.presenter.didForkListFetched(forkListDTO: forListDTO)
        
        XCTAssert(presenter.forkListDTO.owners.count == 0, "Presenter Test Failed")
        XCTAssert(presenter.forkListDTO.isError == true, "Presenter Test Failed")
        XCTAssert(presenter.forkListDTO.errorMessage == "error", "Presenter Test Failed")
        XCTAssert(presenter.forkListDTO.showMore == true, "Presenter Test Failed")
    }
    
    
}
