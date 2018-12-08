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
    @IBOutlet weak var nothingFoundContainerView: UIView!
    
    weak var searchView : SearchView!
    weak var nothingFoundView : NothingFoundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSettings()
        let repoRequest = RepoListRequest(queryString: "detail", pageNumber: "1", perPageElement: "30")
        let  repoListEndpoingProvider = RepoListEndpointProvider(requestObject: repoRequest)
        AlamofireManager.shared.request(repoListEndpoingProvider) { (result) in
            switch result{
            case .success(let data):
                print(data.totalCount)
            case .error(let error):
                print(error.localizedDescription )
            case .failure(let failure):
                print(failure.error ?? "Failure")
            }
        }
    }
    
    private func initialSettings(){
        self.setupSearchView()
        self.setupTableView()
        self.view.backgroundColor = .backgroundColor
        self.addNothingFoundView()
        self.setLogo()
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
