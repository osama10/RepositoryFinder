//
//  SearchView.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: class {
    func didTapOnSearchButton(searchString : String)
}

class SearchView: UIView, NibLoadableView{

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    weak var delegate : SearchViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSearchIconToTextField()
    }
    
    private func addSearchIconToTextField(){
        self.searchTextField.withImage(direction: .left, image: UIImage(named: "search-icon")!, colorSeparator: .clear, colorBorder: .clear, imageBackgroundColor: .clear)
    }
    
    @IBAction func didTapOnSearchButton(_ sender: UIButton) {
        guard let searchString = searchTextField.text else { return }
        if(!searchString.isEmpty){
            self.delegate.didTapOnSearchButton(searchString: searchString)
            
        }
    }
}
