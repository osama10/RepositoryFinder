//
//  MockForkListPresenter.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockForkListPresenter : ForkListInteractorToPresenterDelegate{
    var forkListDTO : ForkListDTO!

    
    func didForkListFetched(forkListDTO: ForkListDTO) {
        self.forkListDTO = forkListDTO
    }
}
