//
//  RepoListServiceImp.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

final class RepoListServicesImp : RepoListServices{
    var networkManager: NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getRepositories(queryString: String, page: Int, perPageNumber: Int, completion: @escaping ((RepoListResult) -> Void)) {
        
        let repoRequest = RepoListRequest(queryString: queryString, pageNumber: page.toString, perPageElement: perPageNumber.toString)
        let  repoListEndpoingProvider = RepoListEndpointProvider(requestObject: repoRequest)
        
        self.networkManager.request(repoListEndpoingProvider) { [weak self] (result) in
           
            guard let `self` = self else { return }
            completion(self.parseResult(result: result))
        }
    }
    
    private func parseResult(result : NetworkResult<RepoListResponse, RequestError, NetworkError>)->RepoListResult{
       
        var repositories : [Repository]?
        var repoResult : RepoListResult!
        
        switch result{
        case .success(let data):
            repositories = data.items
            repoResult = .success(repositories!)
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
