//
//  Beer.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 22/11/17.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import Foundation

class Beer {
    
    var id: Int
    var name: String
    var tagline: String
    var abv: Double
    var ibu: Double
    var description: String
    var image_url: String
    
    init(id: Int, name: String, tagline: String, abv: Double, ibu: Double, description: String, image_url: String) {
        
        self.id = id
        self.name = name
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.description = description
        self.image_url = image_url
    }
}
