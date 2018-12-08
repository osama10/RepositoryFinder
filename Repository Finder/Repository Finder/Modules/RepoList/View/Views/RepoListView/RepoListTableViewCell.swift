//
//  RepoListTableViewCell.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class RepoListTableViewCell: UITableViewCell,NibLoadableView, ReusableView {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var repoTitleLabel: UILabel!
    @IBOutlet weak var repoDetailLabel: UILabel!
    
    @IBOutlet weak var watchersImageView: UIImageView!
    @IBOutlet weak var wathcersLabel: UILabel!
    
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var forkLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSettings()
        
    }
    
    private func initialSettings(){
        self.selectionStyle = .none
        Utils.createCardView(view: self.cardView, backgroundColor: .white, borderColor: .white, borderWidth: 2.0, cornerRadius: 15.0)
        Utils.makeViewCircular(view: self.avatarImageView, borderWidth: 1.0, borderColor: .black)
    }
    
}
