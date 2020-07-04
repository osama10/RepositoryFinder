//
//  EndpointProvider.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol EndpointProvider {
    associatedtype Response: DTO
    associatedtype Body: DTO
    associatedtype Failure: DTO
    
    var endpoint: Endpoint<Body> { get }
}
