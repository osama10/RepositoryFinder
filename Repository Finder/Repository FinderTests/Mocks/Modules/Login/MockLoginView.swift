//
//  MockLoginView.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder


class MockLoginView : LoginViewPresenterToViewDelegate{
   
    var startAnimatingCalled = false
    var stopAnimatingCalled = false
    var errorTitle = ""
    var errorMessage = ""
    var emptyTextFieldsCalled = false
    
    func startAnimatingLoader() {
        self.startAnimatingCalled = true
    }
    
    func stopAnimatingLoader() {
        self.stopAnimatingCalled = true
    }
    
    func showErrorAlert(with title: String, message: String) {
        self.errorTitle = title
        self.errorMessage = message
    }
    
    func emptyTextFields() {
        self.emptyTextFieldsCalled = true
    }
    
    
}
