//
//  ForkListProtocol.swift
//  Forksitory Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import UIKit

protocol ForkListViewToPresenterDelegate : class{
    func viewDidLoad()
    func didTapOnRow(of section:Int, at index: Int)
}

protocol ForkListPresenterToViewDelegate : class{
    func reloadData()
    func startAnimatingLoader()
    func stopAnimatingLoader()
    func showErrorAlert(with title : String, message : String)
}

protocol ForkListPresenterToInteractorDelegate : class {
    func fetchForksList(userName: String, repoName: String, page: Int, perPageNumber: Int, totalForks : Int)
}

protocol ForkListPresenterToRouterDelagate : class {
    func pushToRouterScreen(owner: Owner)
}

protocol ForkListInteractorToPresenterDelegate : class{
    func didForkListFetched(forkListDTO : ForkListDTO)
}


protocol ForkListRouterToPresenterDelegate : class{
    func pop()
}
