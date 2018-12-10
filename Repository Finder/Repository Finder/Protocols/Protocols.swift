//
//  Protocols.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView : class {  static var reuseIdentifier : String {get} }
protocol AlertsPresentable : class {}
protocol NibLoadableView : class { static var nibName : String {get} }
protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> UIViewController
}


