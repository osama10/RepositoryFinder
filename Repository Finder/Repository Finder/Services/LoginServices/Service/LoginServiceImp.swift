//
//  LoginServiceImp.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
typealias LoginCompletion = ((ServicesResult<Owner>)->Void)

final class LoginServiceImp : LoginServices{
    var networkManager: NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func authenticateUser(userName: String, password: String, completion: @escaping LoginCompletion) {
        let requestObject = LoginRequest(userName: userName, password: password)
        let loginEndPointProvider = LoginEndpointProvider(requestObject: requestObject)
        self.networkManager.request(loginEndPointProvider) { [weak self] (result) in
            guard let `self` = self else { return }
            completion(self.parseSearchResult(result: result))
        }
        
    }
    
    private func parseSearchResult(result : NetworkResult<Owner, RequestError, NetworkError>)->ServicesResult<Owner>{
        
        var repoResult : ServicesResult<Owner>!
        
        switch result{
        case .success(let data):
            repoResult = .success(data)
        case .error(let networkerror):
            repoResult = .error(self.parseNetworkError(error: networkerror))
        case .failure(let failure):
            repoResult = .error(failure.message ?? somethingUnexpectedError)
        }
        return repoResult
    }
    
    private func parseNetworkError(error : NetworkError) -> String {
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
