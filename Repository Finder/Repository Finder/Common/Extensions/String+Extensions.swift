//
//  File.swift
//  Repository Finder
//
//  Created by Osama Bashir on 7/4/20.
//  Copyright © 2020 Osama Bin Bashir. All rights reserved.
//

import Foundation

extension String {
    var toDouble : Double { Double(self) ?? 0.0 }
    func isBlank() -> Bool {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
}

