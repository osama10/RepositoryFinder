//
//  ForkListTableViewCell.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ForkListTableViewCell: UITableViewCell,NibLoadableView,ReusableView {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var loginNameLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        Utils.makeViewCircular(view: self.avatarImageView, borderWidth: 1.0, borderColor: .black)

    }

}
