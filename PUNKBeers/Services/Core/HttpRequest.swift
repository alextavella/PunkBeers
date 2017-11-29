//
//  HttpRequest.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 22/11/17.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import Foundation

enum HttpType {
    case
        GET,
        POST,
        DELETE,
        PATCH
}

class HttpRequest {
    
    let type: HttpType
    let endpoint: String
    let data: Any?
    
    var handlers: [HttpHandler] = []
    
    init(type: HttpType, endpoint: String, data: Any?) {
        self.type = type
        self.endpoint = endpoint
        self.data = data
    }
    
    func addHandler(handler: HttpHandler) -> Void {
        self.handlers.append(handler)
    }
}
