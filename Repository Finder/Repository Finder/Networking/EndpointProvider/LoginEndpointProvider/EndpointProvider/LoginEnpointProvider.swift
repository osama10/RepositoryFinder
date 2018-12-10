//
//  LoginEnpointProvider.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

struct LoginEndpointProvider  {
    var requestObject : LoginRequest
  
    private func getHeaders() -> [String: String] {
        let userName = requestObject.userName
        let password = requestObject.password
        let credentialData = "\(userName):\(password)".data(using: .utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        return headers
    }
}

extension LoginEndpointProvider : EndpointProvider{
    typealias Response = Owner
    
    typealias Body = EmptyDTO
    
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        let headers = self.getHeaders()
        return Endpoint(api: .userAuthentication, method: .get, headers : headers)
    }
    
    
}
