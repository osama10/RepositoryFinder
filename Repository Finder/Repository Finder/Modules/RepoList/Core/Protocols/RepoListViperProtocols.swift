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
    func didTapOnDismissButton()
}

protocol RepoListPresenterToViewDelegate : class{
    func reloadData()
    func scrollTableViewToTop()
    func startAnimatingLoader()
    func stopAnimatingLoader()
    func showNoResultFoundAlert()
    func showErrorAlert(with title : String, message : String)
    func setNavBarButton(with title : String)
    func hideSearchBar()
}

protocol RepoListPresenterToInteractorDelegate : class {
    func fetchUserRepositories(userName : String, page : Int, perPageNumber : Int, totalRepo : Int)
    func fetchSearchRepositories(queryString : String, page : Int, perPageNumber : Int)
}

protocol RepoListPresenterToRouterDelagate : class{
    func pushToForkScreen(repository : String, userName : String, totalForks : Int)
    func dismissForkList()
}

protocol RepoListInteractorToPresenterDelegate : class{
    func didRepositoriesFetched(repoListDTO : RepoListDTO)
}


protocol RepoListRouterToPresenterDelegate : class{
    
}
