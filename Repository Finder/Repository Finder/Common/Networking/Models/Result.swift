//
//  Result.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

public enum Result<V ,E: Error> {
    case success(V)
    case error(RequestError)
    case failure(E)
}
