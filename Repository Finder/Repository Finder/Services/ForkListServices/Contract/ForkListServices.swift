//
//  ForkListServices.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 09/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol ForkListServices {
    var networkManager : NetworkManager{ get }
    func getForksList(userName : String, repositoryName : String, page : Int, perPageNumber : Int, completion : @escaping ForkListCompletion )

}
