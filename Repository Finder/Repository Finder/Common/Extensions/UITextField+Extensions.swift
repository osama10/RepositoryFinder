//
//  UITextField+Extensions.swift
//  Repository Finder
//
//  Created by Osama Bashir on 7/4/20.
//  Copyright © 2020 Osama Bin Bashir. All rights reserved.
//

import UIKit

extension UITextField {

    enum Direction {
        case left
        case right
    }

    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor,imageBackgroundColor : UIColor){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 45))
        mainView.layer.cornerRadius = 5

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 45))
        view.backgroundColor = imageBackgroundColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 2.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)

        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)

        if(.left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }

        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }
}
