//
//  RepoListPresenter.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol RepoListPresenter {
    
    var view : PresenterToViewDelegate!{ get }
    var interactor : RepoListPresenterToInteractorDelegate!{ get set }
    var viewType : RepoListType{ get }
    var repoListDTO : RepoListDTO? { get }
    var owner : Owner?{ get }
    var totalRepositories : Int{ get }
    var perPageNumber : Int { get }
    var page : Int { get }
    
    func numberOfRows(section : Int)->Int
    func willShowMore()->Bool
    func getRepository(at index : Int)->Repository
    
    
}

class RepoListPresenterImp : RepoListPresenter{
    
    weak var view: PresenterToViewDelegate!
    var interactor: RepoListPresenterToInteractorDelegate!
    var owner: Owner?
    var viewType: RepoListType
    var repoListDTO: RepoListDTO?
    
    var page: Int = 1
    var perPageNumber: Int = 30
    var queryString = ""
    
    var totalRepositories: Int{
        guard let repoListDTO = self.repoListDTO else { return 0}
        return repoListDTO.repositories.count
    }
    
    init(view : PresenterToViewDelegate ,viewType : RepoListType , owner : Owner? = nil) {
        self.view = view
        self.repoListDTO = nil
        self.viewType = viewType
        self.owner = owner
    }
    
    func numberOfRows(section: Int) -> Int {
        var rowCount = 0
        guard let repoListDTO = self.repoListDTO else {
            return rowCount
        }
        if(section == 0){
            
            rowCount = (repoListDTO.showMore) ? repoListDTO.repositories.count + 1: repoListDTO.repositories.count
        }
        
        return rowCount
    }
    
    func willShowMore() -> Bool {
        guard let repoListDTO = self.repoListDTO else {
            return false
        }
        return repoListDTO.showMore
        
    }
    
    func getRepository(at index: Int) -> Repository {
        
        return repoListDTO!.repositories[index]
    }
    
    private func getRepositories(){
        if(viewType == .user){
            guard let userName = owner?.login else {
                self.view.showErrorAlert(with: "Error", message:somethingUnexpectedError )
                return
            }
            self.interactor.fetchUserRepositories(userName: userName)
        }
    }
    
    private func getSearchRespositories(queryString : String, page : Int, perPageNumber : Int){
        self.interactor.fetchSearchRepositories(queryString: queryString, page: page , perPageNumber: perPageNumber)
    }
}

extension RepoListPresenterImp : RepoLisViewToPresenterDelegate{
    func viewDidLoad() {
      
    }
    
    func search(queryString: String) {
        self.page = 1
        self.queryString = queryString
        self.repoListDTO?.showMore = false
        self.view.scrollTableViewToTop()
        self.view.startAnimatingLoader()
        self.getSearchRespositories(queryString: queryString, page: self.page, perPageNumber: self.perPageNumber)
    }
    
    func didTapOnRow(with index: Int) {
        guard let showMore = self.repoListDTO?.showMore else { return }
        
        if(showMore && index == self.repoListDTO?.repositories.count){
            self.page = self.page + 1
            self.view.startAnimatingLoader()
            self.getSearchRespositories(queryString: self.queryString, page: self.page, perPageNumber: self.perPageNumber)
            
        }
    }
    
}

extension RepoListPresenterImp : RepoListInteractorToPresenterDelegate{
    func didRepositoriesFetched(repoListDTO: RepoListDTO) {
       
        if(self.willShowMore()){
            var repositories =  self.repoListDTO?.repositories
            repositories!.append(contentsOf: repoListDTO.repositories)
            self.repoListDTO = repoListDTO
            self.repoListDTO?.repositories = repositories!
        }else{
            self.repoListDTO = repoListDTO
            if((self.repoListDTO?.repositories.count)! <= 0){
                self.view.showNoResultFoundAlert()
            }
        }
        
        self.view.stopAnimatingLoader()
        self.view.reloadData()
       
       
    }
}











