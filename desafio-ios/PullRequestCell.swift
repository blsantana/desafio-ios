//
//  PullRequestCell.swift
//  desafio-ios2
//
//  Created by Bruno Santana on 11/29/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import Foundation

import UIKit

class PullRequestCell: UITableViewCell
{

    @IBOutlet weak var titlePullRequestLabel: UILabel!

    @IBOutlet weak var userLoginLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var dateCreationLabel: UILabel!
    @IBOutlet weak var bodyPullRequestTextView: UITextView!
    
    func fillCell(pullRequest: PullRequest) {
        
        
        self.titlePullRequestLabel.text = pullRequest.title
        self.dateCreationLabel.text = "Creation : \(pullRequest.getDateCriantionFormatted())"
        
        self.bodyPullRequestTextView.text = pullRequest.body
        
        self.userLoginLabel.text = pullRequest.user.login
        
        self.userImageView.sd_setImage(with: NSURL(string: pullRequest.user.urlImage) as URL!)
        
        
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width/2
        self.userImageView.clipsToBounds = true
        self.userImageView.contentMode = .scaleAspectFit
        
    }
    
  
    
}
