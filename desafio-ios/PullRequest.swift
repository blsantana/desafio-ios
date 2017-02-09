//
//  PullRequest.swift
//  desafio-ios2
//
//  Created by Bruno Santana on 11/29/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import Foundation
import Unbox

class PullRequest: Unboxable {
    
    
    var dateCriation : String
    var user : User
    var title : String
    var body : String
    var state : String
    var htmlUrl : String
    
    required init(unboxer: Unboxer) throws {
        
        self.dateCriation = try unboxer.unbox(key: "created_at")
        self.user = try unboxer.unbox(key: "user")
        self.title = try unboxer.unbox(key: "title")
        self.body = try unboxer.unbox(key: "body")
        self.state = try unboxer.unbox(key: "state")
        self.htmlUrl = try unboxer.unbox(key: "html_url")
        
        
    }
    
    func getDateCriantionFormatted() -> String{
        
        let dateFormatterOutput = DateFormatter()
        let dateFormatterInput = DateFormatter()
        dateFormatterOutput.dateFormat = "dd/MM/yyyy hh:mm:ss"
        dateFormatterInput.dateFormat  = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        
        print(dateFormatterInput.date(from: self.dateCriation))
        if  let date =  dateFormatterInput.date(from: self.dateCriation) {
        
            let dateString = dateFormatterOutput.string(from: date)
            
            return dateString
            
        }
        
        return ""
    }

    
    
}
