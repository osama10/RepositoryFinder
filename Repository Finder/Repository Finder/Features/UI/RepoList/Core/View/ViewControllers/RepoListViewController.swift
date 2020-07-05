//
//  ViewController.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class RepoListViewController: UIViewController,AlertsPresentable, NVActivityIndicatorViewable {
    
    @IBOutlet weak var searchViewContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nothingFoundContainerView: UIView!
    
    @IBOutlet weak var searchViewHeightConstraint: NSLayoutConstraint!
    weak var searchView : SearchView!
    weak var nothingFoundView : NothingFoundView!
    
    var presenter : (RepoListPresenter & RepoLisViewToPresenterDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
        presenter.viewDidLoad()
    }
    
    private func initialSettings(){
        self.setupSearchView()
        self.setupTableView()
        self.view.backgroundColor = .backgroundColor
        self.addNothingFoundView()
        self.setLogo()
        self.nothingFoundContainerView.isHidden = true
        self.hideKeyboardWhenTappedAround()
        self.searchView.searchTextField.delegate = self
        
    }
    
    private func setLogo(){
        let image  = UIImage(named: "logo")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
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
    
    private func addNothingFoundView(){
        let width = nothingFoundContainerView.frame.width
        let height  = nothingFoundContainerView.frame.height
        
        nothingFoundView = NothingFoundView.loadNib()
        nothingFoundView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        nothingFoundContainerView.addSubview(nothingFoundView)
    }
}

extension RepoListViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
    }
}

extension RepoListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRows(section: 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.getCell(of:tableView , at: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapOnRow(with: indexPath.row)
    }
    
    private func getCell(of tableView : UITableView , at indexPath : IndexPath)->UITableViewCell{
        var cell : UITableViewCell!
        
        if(presenter.willShowMore()){
            if(indexPath.row == self.presenter.totalRepositories){
                let _cell = tableView.dequeResuseableCell(for: indexPath) as ShowMoreTableViewCell
                cell = _cell
            }else {
                let _cell = tableView.dequeResuseableCell(for: indexPath) as RepoListTableViewCell
                _cell.setData(repository: self.presenter.getRepository(at: indexPath.row))
                
                cell = _cell
            }
        }else{
            let _cell = tableView.dequeResuseableCell(for: indexPath) as RepoListTableViewCell
            _cell.setData(repository: self.presenter.getRepository(at: indexPath.row))
            cell = _cell
        }
        
        return cell
    }
}

extension RepoListViewController : RepoListPresenterToViewDelegate{
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func scrollTableViewToTop() {
        self.tableView.scroll(to: .top, animated: false)

    }
    func startAnimatingLoader() {
        self.startAnimating()
    }
    
    func stopAnimatingLoader() {
        self.stopAnimating()
        
    }
    
    func showNoResultFoundAlert() {
        self.nothingFoundContainerView.isHidden = false
    }
    
    func showErrorAlert(with title : String, message : String) {
        self.showAlert(with: title, and: message)
    }
    
    func hideSearchBar() {
        self.searchViewContainerView.isHidden = true
        self.searchViewHeightConstraint.constant = 0
    }
}


extension RepoListViewController : SearchViewDelegate{
    func didTapOnSearchButton(searchString: String) {
        self.nothingFoundContainerView.isHidden = true
        presenter.search(queryString: searchString)
    }
}
