//
//  MockRepoListView.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockRepoListView  : RepoListPresenterToViewDelegate{
    
    var reoloadDataCalled = false
    var startAnimatingLoaderCalled = false
    var stopAnimatingLoaderCalled = false
    var title = ""
    var message = ""
    var tableViewToTop = false
    var noResultFoundCalled = false
    var navBarTitle = ""
    var hideSearchBarCalled = false
    
    func reloadData() {
        self.reoloadDataCalled = true
    }
    
    func scrollTableViewToTop() {
        self.tableViewToTop = true
    }
    
    func startAnimatingLoader() {
        self.startAnimatingLoaderCalled = true
    }
    
    func stopAnimatingLoader() {
        self.stopAnimatingLoaderCalled = true
    }
    
    func showNoResultFoundAlert() {
        self.noResultFoundCalled = true
    }
    
    func showErrorAlert(with title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    func setNavBarButton(with title: String) {
        self.navBarTitle = title
    }
    
    func hideSearchBar() {
        self.hideSearchBarCalled = true
    }
    
    
}
