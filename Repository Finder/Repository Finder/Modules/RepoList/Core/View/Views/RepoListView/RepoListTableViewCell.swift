//
//  RepoListTableViewCell.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import SDWebImage

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
    
    func setData(repository : Repository){
        let imageUrl = repository.owner?.avatarURL
        self.avatarImageView.setAvatarImage(imageURL: imageUrl)
        self.repoTitleLabel.text = repository.name ?? "Repository name not found"
        self.repoDetailLabel.text = repository.description ?? "No description"
        self.forkLabel.text = (repository.forks ?? 0).toString
        self.wathcersLabel.text = (repository.watchers ?? 0).toString
    }
    
//    private func setAvatarImage(imageURL : String?){
//        guard let url = imageURL else {
//            self.avatarImageView.image = UIImage(named: "no-image")
//            return
//        }
//
//        self.avatarImageView.sd_setShowActivityIndicatorView(true)
//        self.avatarImageView.sd_setIndicatorStyle(.gray)
//        self.avatarImageView.sd_setImage(with: URL(string:url ))
//    }
}
