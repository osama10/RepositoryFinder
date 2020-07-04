//
//  AlamofireManager.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import Alamofire

final class AlamofireManager : NetworkManager{
    static var shared: NetworkManager = AlamofireManager()
    
    
    func request<E>(_ endpointProvider: E, completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void)) where E : EndpointProvider {
        let httpMethod = self.getAlamofireHttpMethod(method: endpointProvider.endpoint.method)
       
        Utils.log("URL \(endpointProvider.endpoint.url)")
        Alamofire.request(
            endpointProvider.endpoint.url,
            method: httpMethod ,
            parameters: endpointProvider.endpoint.body.dictionary,
            encoding: URLEncoding.default,
            headers: endpointProvider.endpoint.headers
            )
            .responseData
            { (response) in
               
                if let responseCode = response.response?.statusCode, !(200..<209).contains(responseCode) {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let errorDto = try decoder.decode(E.Failure.self, from: data)
                            Utils.log("Request Error \(errorDto)")
                            completion(.failure(errorDto))
                        } catch let exception {
                            completion(.error(.server(serverNotRespondingError)))
                            Utils.log("Server Exception \(exception)")
                            
                        }
                    } else {
                        
                        completion(.error(.server(response.error?.localizedDescription ?? serverNotRespondingError)))
                        Utils.log("Server Error \(String(describing: response.error))")
                        
                    }
                    
                }else {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let dto = try decoder.decode(E.Response.self, from: data)
                            Utils.log("DTO \(dto)")
                            completion(.success(dto))
                        } catch let exception {
                            completion(.error(.decoding(badDataError)))
                        }
                    }
                }
        }
    }
    
    private func getAlamofireHttpMethod(method : HTTPMethods)->HTTPMethod{
        var alamofireMethod : HTTPMethod!
        switch method {
        case .get:
            alamofireMethod = .get
        case .post:
            alamofireMethod = .post
        case .put:
            alamofireMethod = .put
        case .patch:
            alamofireMethod = .patch
        case .delete:
            alamofireMethod = .delete
            
        }
        return alamofireMethod
    }
    
}
