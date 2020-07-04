//
//  RepoListUserEndProvider.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct RepoListUserEndProvider {
    let requestObject : RepoListUserRequest
    
    private func  getQueryParams()->[String : String]{
        return ["page" : requestObject.page, "per_page" : requestObject.perPageNumber]
    }
}

extension RepoListUserEndProvider : EndpointProvider{
    typealias Response = Array<Repository>
    typealias Body = EmptyDTO
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        var api : API = .userRepositories
        api.path = ["users", requestObject.userName, "repos"]
        return Endpoint(api: api, method: .get, queryParams : self.getQueryParams())
    }
}
