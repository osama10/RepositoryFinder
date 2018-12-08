//
//  RepoListEndpointProvider.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct RepoListEndpointProvider {
    let requestObject : RepoListRequest
    private func getQueryParams()->QueryParams{
        return ["q" : requestObject.queryString, "page" : requestObject.pageNumber, "per_page" : requestObject.perPageElement]
    }
}

extension RepoListEndpointProvider : EndpointProvider{
    typealias Response = RepoListResponse
    
    typealias Body = RepoListRequest
    
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body> {
        return Endpoint(api: .repositories, method: .get, headers: ["Content-Type" : "application/json"], queryParams: self.getQueryParams())
    }
    
}
