//
//  ShowMoreTableViewCell.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class ShowMoreTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var cardView: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        Utils.createCardView(view: self.cardView, backgroundColor: .white, borderColor: .white, borderWidth: 2.0, cornerRadius: 15.0)
        self.selectionStyle = .none
    }

}
