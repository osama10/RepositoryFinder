//
//  MockForkListView.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockForkListView : ForkListPresenterToViewDelegate{
    
    var reoloadDataCalled = false
    var startAnimatingLoaderCalled = false
    var stopAnimatingLoaderCalled = false
    var title = ""
    var message = ""
    
    func reloadData() {
        self.reoloadDataCalled = true
    }
    
    func startAnimatingLoader() {
        self.startAnimatingLoaderCalled = true
    }
    
    func stopAnimatingLoader() {
        self.stopAnimatingLoaderCalled = true
    }
    
    func showErrorAlert(with title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    
}
