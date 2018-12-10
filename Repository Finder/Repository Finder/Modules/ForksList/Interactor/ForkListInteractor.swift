//
//  ForkListInteractor.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol ForkListInteractor {
    var forkListServices : ForkListServices{ get }
    var presenter : ForkListInteractorToPresenterDelegate!{ get set}
}

class ForkListInteractorImp : ForkListInteractor{
    var forkListServices: ForkListServices
    var presenter: ForkListInteractorToPresenterDelegate!
    var page : Int = 0
    var perPageNumber = 0
    var totalForks = 0
    
    init(forkListServices : ForkListServices) {
        self.forkListServices = forkListServices
    }
    
    private func getForksList(userName: String, repoName: String, page: Int, perPageNumber: Int){
        self.forkListServices.getForksList(userName: userName, repositoryName: repoName, page: page, perPageNumber: perPageNumber) { [weak self] (result) in
            guard let `self` = self else { return }
            let forkListDTO = self.preapreDataFromForkListRequest(result: result)
            self.presenter.didForkListFetched(forkListDTO: forkListDTO)
        }
    }
    
    private func preapreDataFromForkListRequest(result : ServicesResult<Array<Owner>>)->ForkListDTO{
        var forkListDTO : ForkListDTO!
        switch result {
        case .success(let data):
             let shouldShowMore = ((self.perPageNumber) * self.page < totalForks) ? true : false
            forkListDTO = ForkListDTO(owners: data, isError: false, errorMessage: "", showMore: shouldShowMore)
        case .error(let errorMessage):
            forkListDTO = ForkListDTO(owners: [], isError: true, errorMessage: errorMessage, showMore: false)
            
        }
        return forkListDTO
    }
    
    
}

extension ForkListInteractorImp : ForkListPresenterToInteractorDelegate{
   
    
    func fetchForksList(userName: String, repoName: String, page: Int, perPageNumber: Int, totalForks : Int) {
        
        self.page = page
        self.perPageNumber = perPageNumber
        self.totalForks = totalForks
        self.getForksList(userName: userName, repoName: repoName, page: page, perPageNumber: perPageNumber)
    }
}
