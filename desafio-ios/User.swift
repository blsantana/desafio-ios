//
//  User.swift
//  desafio-ios2
//
//  Created by Bruno Santana on 11/29/16.
//  Copyright © 2016 Bruno Santana. All rights reserved.
//

import Foundation
import Unbox

class User: Unboxable {
    
    var login : String
    var urlImage: String
    
    
    required init(unboxer: Unboxer) throws {
        self.login = try unboxer.unbox(key: "login")
        self.urlImage = try unboxer.unbox(key: "avatar_url")
        
    }
   /* required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        urlImage <- map["avatar_url"]
        
    }*/
}
