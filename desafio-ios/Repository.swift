//
//  Repository.swift
//  desafio-ios
//
//  Created by Bruno Santana on 11/24/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import Foundation
import Unbox



class Repository: Unboxable {
    
    var name : String
    var description : String
    var owner : User
    var totalStars : Int
    var totalForks: Int
    
    
    required init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.description = try unboxer.unbox(key: "description")
        self.owner = try unboxer.unbox(key: "owner")
        self.totalStars = try unboxer.unbox(key: "stargazers_count")
        self.totalForks = try unboxer.unbox(key: "forks_count")

    }
    
    /*required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        owner <- map["owner"]
        totalStars <- map["stargazers_count"]
        totalForks <- map["forks_count"]
        
    }
  */
    
    
}
