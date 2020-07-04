//
//  UIImageView+Extension.swift
//  Repository Finder
//
//  Created by Osama Bashir on 7/4/20.
//  Copyright © 2020 Osama Bin Bashir. All rights reserved.
//

import UIKit

extension UIImageView{
    func setAvatarImage(imageURL : String?){
        guard let url = imageURL else {
            self.image = UIImage(named: "no-image")
            return
        }
        self.sd_setShowActivityIndicatorView(true)
        self.sd_setIndicatorStyle(.gray)
        self.sd_setImage(with: URL(string:url ))
    }
}

