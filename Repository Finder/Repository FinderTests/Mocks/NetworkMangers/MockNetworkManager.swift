//
//  MockManager.swift
//  Repository FinderTests
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
@testable import Repository_Finder

class MockNetworkManager : NetworkManager{

    static var shared: NetworkManager = MockNetworkManager()

    func request<E>(_ endpointProvider: E, completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void)) where E : EndpointProvider {

    }


}
