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
    var owner : Owner { get }
    var repoName : String { get }
    var page : Int {get}
    var perPageNumber : Int{ get }
    var totalForks : Int{ get }

    var sections: Int { get }
    func title(for: Int) -> String
    func numberOfRows(section : Int)->Int
    func heightForRow(at index : Int)->Int
    func willShowMore()->Bool
    func getOwner(of section:Int, at index : Int) -> Owner
}

class ForkListPresenterImp : ForkListPresenter{
    
    weak var view: ForkListPresenterToViewDelegate!
    var interactor: ForkListPresenterToInteractorDelegate!
    var router: ForkListPresenterToRouterDelagate!
    
    var owner: Owner
    var repoName: String
    var forkListDTO: ForkListDTO?
    var page: Int = 1
    var perPageNumber: Int = 30
    var totalForks: Int
    
    var numberOfForks: Int {
        guard let forkListDTO = forkListDTO else { return 0}
        return forkListDTO.owners.count
    }

    var sections: Int { return 2 }

    init(view: ForkListPresenterToViewDelegate, owner: Owner, repoName: String, totalForks: Int) {
        self.view = view
        self.owner = owner
        self.repoName = repoName
        self.totalForks = totalForks
    }

    func title(for section: Int) -> String { section == 0 ? "Owner" : "Forks" }
    
    func heightForRow(at index: Int) -> Int {
        return (numberOfForks == index) ? 60 : 120
    }
    
    func numberOfRows(section: Int) -> Int {
        var rowCount = 0

        guard let forkListDTO = forkListDTO else { return rowCount }

        if(section == 1){
            rowCount = (forkListDTO.showMore) ? forkListDTO.owners.count + 1: forkListDTO.owners.count
        } else {
            rowCount = 1
        }
        
        return rowCount
    }
    
    func willShowMore() -> Bool {
        guard let forkListDTO = self.forkListDTO else { return false }
        return forkListDTO.showMore
    }
    
    func getOwner(of section: Int, at index: Int) -> Owner {
        return section == 0 ? owner : (self.forkListDTO?.owners[index])!
    }
    
    private func getForksList(userName : String , repoName : String, page : Int, perPageNumber : Int , totalForks : Int){
        self.interactor.fetchForksList(userName: userName, repoName: repoName, page: page, perPageNumber: perPageNumber, totalForks: totalForks)
    }
}

extension ForkListPresenterImp : ForkListViewToPresenterDelegate{
    func viewDidLoad() {
        view.startAnimatingLoader()
        guard let userName = owner.login else {
            view.showErrorAlert(with: "Error", message: somethingUnexpectedError)
            return
        }
        self.getForksList(userName: userName, repoName: self.repoName, page: self.page, perPageNumber: self.perPageNumber, totalForks: self.totalForks)
    }
    
    func didTapOnRow(of section:Int, at index: Int) {
        didTapOnRowHandler(of: section, at: index)
    }
    
    private func didTapOnRowHandler(of section:Int, at index: Int) {
        if section == 0 {
            router.pushToRouterScreen(owner: owner)
        } else {
            if(index == (numberOfForks)){
                showMoreRepositories()
            } else {
                guard let owner = forkListDTO?.owners[index] else {
                    view.showErrorAlert(with: "Error", message: somethingUnexpectedError)
                    return
                }
                router.pushToRouterScreen(owner: owner)
            }
        }

    }
    
    private func showMoreRepositories(){
        let userName = owner.login!
        self.page = self.page + 1
        self.view.startAnimatingLoader()
        self.getForksList(userName: userName, repoName: self.repoName, page: self.page, perPageNumber: self.perPageNumber, totalForks: self.totalForks)
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
        view.showErrorAlert(with: "Request Failed", message: errorMessage)
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
