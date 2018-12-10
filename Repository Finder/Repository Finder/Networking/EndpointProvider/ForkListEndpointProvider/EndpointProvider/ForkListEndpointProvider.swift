//
//  ForkListEndpointProvider.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct ForkListEndpointProvider {
    let requestObject : ForkListRequest
    private func getQueryParams()->QueryParams{
        return ["page" : requestObject.page, "per_page" : requestObject.perPageNumber]
    }
}

extension ForkListEndpointProvider : EndpointProvider{
    typealias Response = Array<ForkListResponse>
    typealias Body = ForkListRequest
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        var api : API = .forks
        api.path = ["repos", requestObject.userName, requestObject.repoName, "forks"]
        return Endpoint(api: api, method: .get, queryParams: self.getQueryParams())
    }
}
