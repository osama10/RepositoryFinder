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
        Alamofire.request(
            endpointProvider.endpoint.url,
            method: httpMethod ,
            parameters: endpointProvider.endpoint.body.dictionary,
            encoding: URLEncoding.default,
            headers: endpointProvider.endpoint.headers
            )
            .responseData
            { (response) in
                
                if !(200...209).contains(response.response!.statusCode) {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let errorDto = try decoder.decode(E.Failure.self, from: data)
                            completion(.failure(errorDto))
                        } catch let exception {
                            completion(.error(.server(exception)))
                        }
                    } else {
                        
                        completion(.error(.server(response.error)))
                    }
                    
                }else {
                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let dto = try decoder.decode(E.Response.self, from: data)
                            completion(.success(dto))
                        } catch let exception {
                            completion(.error(.decoding(data, exception)))
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
