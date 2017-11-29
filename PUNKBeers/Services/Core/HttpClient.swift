//
//  HttpClient.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 22/11/17.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import Foundation

class HttpClient {
    
    let basePath: String
    
    // Session
    let session: URLSession
    
    // Configuration
    let configuration: URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        return config
    }()
    
    
    init(basePath: String) {
        self.basePath = basePath
        self.session = URLSession(configuration: self.configuration)
    }
    
    func request(request: HttpRequest, onComplete: @escaping (Any?) -> Void) {
        
        let format = { (response: Data) -> Any in
            var result: Any = {}
            for handler in request.handlers {
                result = try! handler.format(response: response)
            }
            return result
        }
        
        func onError() {
            onComplete(nil)
        }
        
        let url = self.basePath + request.endpoint
        print(url)
        
        switch(request.type) {
        case .GET:
            get(url: url, onComplete: { (response: Data?) in
                guard let response = response else { return }
                let result = format(response)
                onComplete(result)
            })

        case .POST, .DELETE, .PATCH:
            onComplete(nil)
        }
    }
    
    private func get(url: String, onComplete: @escaping (Data?) -> Void) {
        
        guard let url = URL(string: url) else {return}
        
        self.session
            .dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                func onError() {
                    onComplete(nil)
                }
                
                if error != nil {
                    print("Error: \(error!.localizedDescription)")
                    onError()
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200 {
                    
                    guard let data = data else {return}
//                    do {
                    
                        onComplete(data)
                        
//                    } catch {
//                        print("Error Serialiaze Object: \(error.localizedDescription)")
//                        onError()
//                    }
                    
                } else {
                    print("Internal Error: \(response.statusCode)")
                    onError()
                }
                
            }.resume()
    }
}

