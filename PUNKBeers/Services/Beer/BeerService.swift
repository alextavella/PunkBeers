//
//  BeerService.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 22/11/17.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import Foundation

class BeerService {
    
    let httpClient: HttpClient
    let basePath: String = "https://api.punkapi.com/v2/"
    let ENDPOINT: [String: String] = ["GET": "beers"]
    
    init() {
        httpClient = HttpClient(basePath: self.basePath)
    }
    
    func getAll(onComplete: @escaping ([Beer]) -> Void) {
        
        let url: String = ENDPOINT["GET"]!
        let request: HttpRequest = HttpRequest(type: HttpType.GET, endpoint: url, data: nil)
        request.addHandler(handler: BeerHandler())
        
        httpClient.request(request: request, onComplete: { (response: Any?) in
            if let result = response as? [Beer] {
                onComplete(result)
            } else {
                onComplete([])
            }
        })
    }
}

