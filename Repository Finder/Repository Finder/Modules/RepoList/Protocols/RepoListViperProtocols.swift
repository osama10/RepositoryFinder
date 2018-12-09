//
//  RepoListViperProtocols.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol RepoLisViewToPresenterDelegate : class{
    func viewDidLoad()
    func search(queryString : String)
    func didTapOnRow(with index : Int)
}

protocol PresenterToViewDelegate : class{
    func reloadData()
    func scrollTableViewToTop()
    func startAnimatingLoader()
    func stopAnimatingLoader()
    func showNoResultFoundAlert()
    func showErrorAlert(with title : String, message : String)
}

protocol RepoListPresenterToInteractorDelegate : class {
    func fetchUserRepositories(userName : String)
    func fetchSearchRepositories(queryString : String, page : Int, perPageNumber : Int)
}

protocol PresenterToRouterDelagate : class{
    
}

protocol RepoListInteractorToPresenterDelegate : class{
    func didRepositoriesFetched(repoListDTO : RepoListDTO)
}


protocol RouterToPresenterDelegate : class{
    
}
