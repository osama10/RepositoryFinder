//
//  UINavigationViewController+Extensions.swift
//  Repository Finder
//
//  Created by Osama Bashir on 7/4/20.
//  Copyright © 2020 Osama Bin Bashir. All rights reserved.
//

import UIKit

extension UINavigationController {
    func makeDefaultSettings(){
        self.navigationBar.barTintColor = .black
        self.navigationBar.backgroundColor = .black
        self.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
    }
}
