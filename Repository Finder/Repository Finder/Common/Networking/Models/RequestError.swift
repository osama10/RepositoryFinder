//
//  RequestError.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

import Foundation

public struct RequestError: DTO, Error {
    let statusCode: Int?
    let error: String?
    let message: String?
    
    var localizedDescription: String {
        return message ?? "Something unexpected"
    }
}
