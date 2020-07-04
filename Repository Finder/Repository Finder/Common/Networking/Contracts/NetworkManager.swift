//
//  NetworkManager.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol NetworkManager {
    static var shared : NetworkManager { get }
    
    func request<E: EndpointProvider>(_ endpointProvider: E,
                                      completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void))
    
}
