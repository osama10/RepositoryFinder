//
//  ForkListViewController.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ForkListViewController: UIViewController, AlertsPresentable, NVActivityIndicatorViewable {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter : (ForkListPresenter & ForkListViewToPresenterDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSettings()
        
    }
    
    private func initialSettings(){
        self.setupTableView()
        self.title = self.presenter.repoName
        self.presenter.viewDidLoad()
        self.view.backgroundColor = .backgroundColor
    }
    
    private func setupTableView(){
        self.tableView.setdelegateAndDatasource(for: self)
        self.tableView.register(ShowMoreTableViewCell.self)
        self.tableView.register(ForkListTableViewCell.self)
    }
    
}

extension ForkListViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.getCell(of : tableView,  at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.presenter.heightForRow(at: indexPath.row).toCGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didTapOnRow(with: indexPath.row)
    }
    
    private func getCell(of tableView : UITableView , at indexPath : IndexPath)->UITableViewCell{
        var cell : UITableViewCell!
        if(indexPath.row == self.presenter.numberOfForks){
            let showMoreCell = tableView.dequeResuseableCell(for: indexPath) as ShowMoreTableViewCell
            cell = showMoreCell
        }else {
            let forkListCell = tableView.dequeResuseableCell(for: indexPath) as ForkListTableViewCell
            forkListCell.setData(owner: self.presenter.getOwner(at: indexPath.row))
            cell = forkListCell
        }
        
        
        return cell
    }
}

extension ForkListViewController : ForkListPresenterToViewDelegate{
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func startAnimatingLoader() {
        self.startAnimating()
    }
    
    func stopAnimatingLoader() {
        self.stopAnimating()
    }
    
    
    func showErrorAlert(with title: String, message: String) {
        self.showAlert(with: title, and: message)
    }
    
    
}



