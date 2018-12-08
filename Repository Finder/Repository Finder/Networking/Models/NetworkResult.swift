//
//  NetworkResult.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//


import Foundation

public enum NetworkResult<V, W, E: Error> {
    case success(V)
    case failure(W)
    case error(E)
}
