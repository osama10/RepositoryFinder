//
//  ForkListServicesImp.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

typealias ForkListCompletion = ((ServicesResult<Array<Owner>>) -> Void)


final class ForkListServicesImp : ForkListServices{
    
    
    var networkManager: NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getForksList(userName : String, repositoryName : String, page : Int, perPageNumber : Int, completion : @escaping ForkListCompletion ) {
        
        let forkListRequest = ForkListRequest(userName: userName, repoName: repositoryName, page: page.toString, perPageNumber: perPageNumber.toString)
        
        let  forkListUserEndpointProvider = ForkListEndpointProvider(requestObject: forkListRequest)
        
        self.networkManager.request(forkListUserEndpointProvider) { [weak self] (result) in
            
            guard let `self` = self else { return }
            let res = self.parseForksResult(result: result)
            completion(res)
        }
    }
    
    private func parseForksResult(result : NetworkResult<Array<ForkListResponse>, RequestError, NetworkError>)->ServicesResult<Array<Owner>>{
        
        var repoResult : ServicesResult<Array<Owner>>!
        
        switch result{
        case .success(let data):
            let owner = data.map{ $0.owner }
            repoResult = .success(owner)
        case .error(let networkerror):
            repoResult = .error(self.parseNetworkError(error: networkerror))
        case .failure(let failure):
            repoResult = .error(failure.message ?? somethingUnexpectedError)
        }
        return repoResult
    }
    
    
    private func parseNetworkError(error : NetworkError)->String{
        var errorString = ""
        switch error {
        case .requestCreation(let badRequest):
            errorString = badRequest
        case .server(let serverError) :
            errorString = serverError
        case .decoding(let dataError):
            errorString = dataError
        }
        return errorString
    }
    
}
