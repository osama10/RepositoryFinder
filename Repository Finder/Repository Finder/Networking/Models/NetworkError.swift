//
//  NetworkError.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case requestCreation
    case decoding(Data?, Error?)
    case server(Error?)
}

