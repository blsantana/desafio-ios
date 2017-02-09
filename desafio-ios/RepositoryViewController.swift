//
//  ViewController.swift
//  desafio-ios2
//
//  Created by Bruno Santana on 11/27/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import UIKit

import Alamofire

import UnboxedAlamofire

import SDWebImage

class RepositoryViewController: UITableViewController {
    
    
    @IBOutlet var repositorysTableView: UITableView!
    
   
    @IBOutlet weak var viewReloadRepositorys: UIView!
    
    
   let lodingRepositoryTableView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    
    var gitRepositorysResponse : GitRepositorysResponse!
    var allRepositorys = [Repository]()
    var indexOfPageToRequest = 1
    var carregarMaisCelulas = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setLoadingScreen()
        self.loadRepositorys()
        repositorysTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLineEtched
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
    
        return allRepositorys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPrototypeCell", for: indexPath as IndexPath) as! RepositoryCell
        
        
            let repository = allRepositorys[indexPath.row]
        
            cell.fillCell(repository: repository);
        
         
        
            self.view.layoutIfNeeded()
        
        return cell
    }
    
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        self.setLoadingScreen()
       
        if deltaOffset <= 0 {
           
           self.loadRepositorys()
        }
       
    }
    
    func loadRepositorys() {
        if ( !self.carregarMaisCelulas ) {
            
            
           
            self.carregarMaisCelulas = true
            let url = "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=\(self.indexOfPageToRequest)";
            
            Alamofire.request(url, method: .get).responseObject { (response: DataResponse<GitRepositorysResponse>) in
                self.indexOfPageToRequest += 1
                if let gitRepositorysResponse = response.result.value {
           
                 self.allRepositorys.append(contentsOf: gitRepositorysResponse.repositorys)
                 self.repositorysTableView.reloadData()
                }
                
                self.carregarMaisCelulas = false
               self.removeLoadingScreen()
            
            }
            
           
            
        }
        
        
    }
  
    
    private func setLoadingScreen() {
        
        self.lodingRepositoryTableView.center = view.center
        
       
         self.repositorysTableView.addSubview(self.lodingRepositoryTableView)
         self.lodingRepositoryTableView.bringSubview(toFront: self.view)
         self.lodingRepositoryTableView.startAnimating()
    }
    
    // Remove the activity indicator from the main view
    private func removeLoadingScreen() {
        
        // Hides and stops the text and the spinner
        self.lodingRepositoryTableView.stopAnimating()
        
    }
    
    
    // Override to support conditional editing of the table view.
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "repositoryDetailSegue" {
            
            if let cell = sender as? RepositoryCell {
                
                
                let indexPath = repositorysTableView.indexPath(for: cell)
                
               // let repositoryDetailVC = segue.destination as! RepositoryDetailViewController
                let nav = segue.destination as! UINavigationController
                let repositoryDetailVC = nav.topViewController as! RepositoryDetailViewController

                
                
                if let indexToView = indexPath {
                    
                    repositoryDetailVC.repositoryToView = allRepositorys[indexToView.row]
                    
                }
                
            }
            
        }
    }
     


}

