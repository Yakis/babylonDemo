//
//  RestApiManager.swift
//  babylonDemo
//
//  Created by yakis on 11/01/2017.
//  Copyright © 2017 com.yakis. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

class RestApiManager: NSObject {
    
    static let shared = RestApiManager()
    
    private override init() {
        
    }


    func getData (url: String, completion: @escaping (_ array: [JSON]) -> ()) {
        guard let endpoint = URL(string: url) else {return}
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: endpoint, completionHandler: {data, response, error in
            if let data = data {
                do {
                    let array = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [JSON]
                    completion(array)
                } catch {
                    print(error.localizedDescription)
                }
            }
        })
        task.resume()
    }
    

}
