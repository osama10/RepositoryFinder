//
//  MockLoginInteractor.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockLoginViewInteractor : LoginViewPresenterToInteractorDelegate{
    var userName = ""
    var password = ""
    
    func makeAuthentication(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    
}
