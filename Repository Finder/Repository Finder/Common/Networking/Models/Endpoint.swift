//
//  Endpoint.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import Foundation

public typealias QueryParams = [String: String]
public typealias Headers = [String: String]

struct Endpoint<Body : DTO>{
   
    var api: API
    var method: HTTPMethods = .get
    var headers: Headers?
    var queryParams : QueryParams?
    var body : Body?
    var url : URL {
        var components = URLComponents()

        components.scheme = api.baseURL.scheme
        components.host = api.baseURL.host
        components.port = api.baseURL.port
        components.path = "/" + api.path.joined(separator: "/")
        if let query = self.queryParams{
            components.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
        }
        return components.url!
    }
  
    init(api : API, method : HTTPMethods, headers : Headers? = nil, queryParams : QueryParams? = nil) {
        self.api = api
        self.method = method
        self.headers = headers
        self.queryParams = queryParams
    }
    
  
}



