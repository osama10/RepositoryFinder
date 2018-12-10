//
//  ForkListPresenter.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol ForkListPresenter : class {
    var forkListDTO : ForkListDTO? { get }
    
    var view : ForkListPresenterToViewDelegate!{ get}
    var interactor : ForkListPresenterToInteractorDelegate!{ get set }
    var router : ForkListPresenterToRouterDelagate!{ get set}
    
    var numberOfForks : Int { get }
    var userName : String{ get }
    var repoName : String { get }
    var page : Int {get}
    var perPageNumber : Int{ get }
    var totalForks : Int{ get }
    
    func numberOfRows(section : Int)->Int
    func heightForRow(at index : Int)->Int
    func willShowMore()->Bool
    func getOwner(at index : Int)->Owner
}

class ForkListPresenterImp : ForkListPresenter{
    
    weak var view: ForkListPresenterToViewDelegate!
    var interactor: ForkListPresenterToInteractorDelegate!
    weak var router: ForkListPresenterToRouterDelagate!
    
    var userName: String
    var repoName: String
    var forkListDTO: ForkListDTO?
    var page: Int = 1
    var perPageNumber: Int = 30
    var totalForks: Int
    
    var numberOfForks: Int {
        guard let forkListDTO = self.forkListDTO else { return 0}
        return forkListDTO.owners.count
        
    }
    
    init(view : ForkListPresenterToViewDelegate ,userName : String, repoName : String, totalForks : Int) {
        self.view = view
        self.userName = userName
        self.repoName = repoName
        self.totalForks = totalForks
    }
    
    func heightForRow(at index: Int) -> Int {
        return (self.numberOfForks == index) ? 60 : 120
        
    }
    
    func numberOfRows(section: Int) -> Int {
        var rowCount = 0
        guard let forkListDTO = self.forkListDTO else { return rowCount }
        if(section == 0){
            rowCount = (forkListDTO.showMore) ? forkListDTO.owners.count + 1: forkListDTO.owners.count
        }
        
        return rowCount
    }
    
    func willShowMore() -> Bool {
        guard let forkListDTO = self.forkListDTO else { return false }
        return forkListDTO.showMore
    }
    
    func getOwner(at index: Int) -> Owner {
        return (self.forkListDTO?.owners[index])!
    }
    
    private func getForksList(userName : String , repoName : String, page : Int, perPageNumber : Int , totalForks : Int){
        self.interactor.fetchForksList(userName: userName, repoName: repoName, page: page, perPageNumber: perPageNumber, totalForks: totalForks)
    }
}

extension ForkListPresenterImp : ForkListViewToPresenterDelegate{
    func viewDidLoad() {
        self.view.startAnimatingLoader()
        self.getForksList(userName: self.userName, repoName: self.repoName, page: self.page, perPageNumber: self.perPageNumber, totalForks: self.totalForks)
    }
    
    func didTapOnRow(with index: Int) {
        didTapOnRowHandler(with: index)
    }
    
    private func didTapOnRowHandler(with index : Int){
        if(index == (self.numberOfForks)){
            self.showMoreRepositories()
        }
    }
    
    private func showMoreRepositories(){
        self.page = self.page + 1
        self.view.startAnimatingLoader()
          self.getForksList(userName: self.userName, repoName: self.repoName, page: self.page, perPageNumber: self.perPageNumber, totalForks: self.totalForks)
    }
    
    
}

extension ForkListPresenterImp : ForkListInteractorToPresenterDelegate{
    func didForkListFetched(forkListDTO: ForkListDTO) {
        self.didForkListFetchedHandler(forkListDTO: forkListDTO)
    }
    
    private func didForkListFetchedHandler(forkListDTO: ForkListDTO){
        self.view.stopAnimatingLoader()
        
        if(forkListDTO.isError){
            self.forkListFetchedErrorHandler(errorMessage: forkListDTO.errorMessage)
        }else {
            self.forkListFetchedSuccessfullHandler(forkListDTO : forkListDTO)
        }
    }
    
    private func forkListFetchedErrorHandler(errorMessage : String){
        self.view.showErrorAlert(with: "Request Failed", message: errorMessage)
    }
    
    private func forkListFetchedSuccessfullHandler(forkListDTO: ForkListDTO){
        if(self.willShowMore()){
            self.didForkListFetchedwillShowMoreHandler(forkListDTO: forkListDTO)
        }else{
            self.forkListDTO = forkListDTO
        }
        self.view.reloadData()
    }
    
    private func didForkListFetchedwillShowMoreHandler(forkListDTO: ForkListDTO){
        
        var owners =  self.forkListDTO?.owners
        owners!.append(contentsOf: forkListDTO.owners)
        self.forkListDTO = forkListDTO
        self.forkListDTO?.owners = owners!
    }
    
}
