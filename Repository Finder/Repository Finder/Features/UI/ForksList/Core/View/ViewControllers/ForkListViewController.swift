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

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sections
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.title(for: section)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(of : tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.heightForRow(at: indexPath.row).toCGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapOnRow(of: indexPath.section, at:indexPath.row)
    }
    
    private func getCell(of tableView : UITableView , at indexPath : IndexPath)->UITableViewCell{
        var cell : UITableViewCell!
        if(indexPath.row == presenter.numberOfForks){
            let showMoreCell = tableView.dequeResuseableCell(for: indexPath) as ShowMoreTableViewCell
            cell = showMoreCell
        }else {
            let forkListCell = tableView.dequeResuseableCell(for: indexPath) as ForkListTableViewCell
            forkListCell.setData(owner: presenter.getOwner(of: indexPath.section, at: indexPath.row))
            cell = forkListCell
        }
        
        
        return cell
    }
}

extension ForkListViewController : ForkListPresenterToViewDelegate{

    func reloadData() {
        tableView.reloadData()
    }
    
    func startAnimatingLoader() {
        startAnimating()
    }
    
    func stopAnimatingLoader() {
        stopAnimating()
    }
    
    func showErrorAlert(with title: String, message: String) {
        showAlert(with: title, and: message)
    }
    
}



