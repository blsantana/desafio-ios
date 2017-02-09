//
//  DetalheRepositorioViewController.swift
//  desafio-ios2
//
//  Created by Bruno Santana on 11/29/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import UIKit
import Alamofire


class RepositoryDetailViewController : UITableViewController {
    
    
    var allPullRequests = [PullRequest]()
    
    var repositoryToView : Repository!
    
    @IBOutlet weak var RepositoryNameLabel: UILabel!

    
    @IBOutlet var pullRequestTableView: UITableView!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        
            carregarRepositorios(url: "https://api.github.com/repos/\(self.repositoryToView.owner.login)/\(self.repositoryToView.name)/pulls");
            
       
        self.RepositoryNameLabel.text = repositoryToView.name
        self.pullRequestTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLineEtched
        
    }
    
    
    func carregarRepositorios(url : String) {
        
        Alamofire.request(url, method: .get).responseArray { (response: DataResponse<[PullRequest]>) in
       
            if let pullRequests = response.result.value{
                
                self.allPullRequests.append(contentsOf: pullRequests)
                
                self.pullRequestTableView.reloadData()
            }
       
            
            
        
        }
            
        
    
        
        
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return self.allPullRequests.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPullRequestPrototypeCell", for: indexPath as IndexPath) as! PullRequestCell
        
        
        let pullRequest = self.allPullRequests[indexPath.row]
        
        cell.fillCell(pullRequest: pullRequest)
       
        self.view.layoutIfNeeded()
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pullRequest = self.allPullRequests[indexPath.row]
        openUrl(url: pullRequest.htmlUrl)

    }
    
    
    func openUrl(url: String) {
        if let url = URL(string: url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                                            
                })
            } else {
                _ = UIApplication.shared.openURL(url)
                
            }
        }
    }

    
}



