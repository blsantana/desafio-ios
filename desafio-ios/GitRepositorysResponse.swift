//
//  GitRepositorysResponse.swift
//  desafio-ios
//
//  Created by Bruno Santana on 11/25/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import Foundation

import Unbox

class GitRepositorysResponse: Unboxable {
    
    var repositorys : [Repository]
    
    required init(unboxer: Unboxer) throws {
        self.repositorys = try unboxer.unbox(key: "items")
       
        
    }
}
