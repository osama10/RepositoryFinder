//
//  ViewController.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {
    
    @IBOutlet weak var searchViewContainerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var searchView : SearchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSettings()
    }
    
    private func initialSettings(){
        self.setupSearchView()
        self.setupTableView()
        self.view.backgroundColor = .backgroundColor
    }
    
    private func setupTableView(){
        self.tableView.register(RepoListTableViewCell.self)
        self.tableView.register(ShowMoreTableViewCell.self)
        self.tableView.setdelegateAndDatasource(for: self)
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupSearchView(){
        let width = searchViewContainerView.frame.width
        let height  = searchViewContainerView.frame.height
        searchView = SearchView.loadNib()
        searchView.frame =  CGRect(x: 0, y: 0, width:width , height: height)
        self.searchView.delegate = self
        searchViewContainerView.addSubview(searchView)
    }
    
 
}

extension RepoListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
     
        if(indexPath.row == 4){
            let _cell = tableView.dequeResuseableCell(for: indexPath) as ShowMoreTableViewCell
            cell = _cell
        }else {
            let _cell = tableView.dequeResuseableCell(for: indexPath) as RepoListTableViewCell
            cell = _cell
        }
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension RepoListViewController : SearchViewDelegate{
    func didTapOnSearchButton(searchString: String) {
    }
}
