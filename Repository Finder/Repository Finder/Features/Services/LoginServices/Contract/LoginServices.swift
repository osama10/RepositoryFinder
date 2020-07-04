//
//  LoginServices.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 10/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
protocol LoginServices {
    
    var networkManager : NetworkManager{ get }
    func authenticateUser(userName : String, password : String, completion : @escaping LoginCompletion)
}
