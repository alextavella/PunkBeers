//
//  HttpHandler.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 22/11/17.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import Foundation

protocol HttpHandler {
    
    func format(response: Data) throws -> Any
}
