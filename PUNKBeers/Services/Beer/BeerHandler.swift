//
//  BeerHandler.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 22/11/17.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import Foundation

class BeerHandler : HttpHandler {
    
    init() {}
    
    func format(response: Data) throws -> Any {
        
        let json = try JSONSerialization
            .jsonObject(
                with: response,
                options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
        
        var beers: [Beer] = []
        for item in json {
            
            let id = item["id"] as! Int
            let name = item["name"] as! String
            let tagline = item["tagline"] as! String
            let abv = Double(item["abv"]as? Double ?? 0.0)
            let ibu = Double(item["ibu"] as? Double ?? 0.0)
            let description = item["description"] as! String
            let image_url = item["image_url"] as! String
            
            beers.append(Beer(id: id, name: name, tagline: tagline, abv: abv, ibu: ibu, description: description, image_url: image_url))
        }
        
        return beers
    }
}

