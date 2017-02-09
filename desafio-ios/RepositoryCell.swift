//
//  RepositoryCell.swift
//  desafio-ios2
//
//  Created by Bruno Santana on 11/28/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//


import UIKit

class RepositoryCell: UITableViewCell
{
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    
    @IBOutlet weak var repositoryDescriptionTextView: UITextView!
    
    @IBOutlet weak var ownerLoginLabel: UILabel!
    
    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var totalStarsLabel: UILabel!
   
    @IBOutlet weak var totalForksLabel: UILabel!
    
    
    func fillCell(repository: Repository) {
        
        self.repositoryNameLabel.text = repository.name
        self.repositoryDescriptionTextView.text = repository.description
        
        self.ownerLoginLabel.text = repository.owner.login
        
        
        self.totalForksLabel.text = "\( repository.totalForks)"
        
        self.totalStarsLabel.text = "\( repository.totalStars)"
        
        self.ownerImageView.sd_setImage(with: NSURL(string: repository.owner.urlImage) as URL!)
        
        self.ownerImageView.layer.cornerRadius = self.ownerImageView.frame.size.width/2
        self.ownerImageView.clipsToBounds = true
        self.ownerImageView.contentMode = .scaleAspectFit
        
    }

}
