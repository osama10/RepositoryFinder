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
   
    @IBOutlet weak var cardView: UIView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        Utils.makeViewCircular(view: self.avatarImageView, borderWidth: 1.0, borderColor: .black)
         Utils.createCardView(view: self.cardView, backgroundColor: .white, borderColor: .white, borderWidth: 2.0, cornerRadius: 15.0)
    }

     func setData(owner : Owner){
        self.avatarImageView.setAvatarImage(imageURL: owner.avatarURL)
        self.loginNameLabel.text = owner.login ?? "No Login Name"
    }
}
