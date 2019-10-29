//
//  PersonController.swift
//  FindACrew
//
//  Created by John Pitts on 10/29/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import Foundation

class PersonController {
    
    let baseURL = URL(string: "https://swapi.co/api/people/")!
    var people: [Person] = []
    enum HTTPMethod: String {                 // created Code Snippet for this (select code & right click)
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        
        // URLComponents is the Pappa class which will include all the stuff you need to create your proper URL query
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        guard let  requestURL = urlComponents?.url else {
            print("Request URL is nil")
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        // "shared" is a singleton object, only one can exist in your whole app
        URLSession.shared.dataTask(with: request) { (data, _, error) in            // "trailing closure syntax"
            if let error = error {
                NSLog("Error in URLSession \(error)")
                completion()
                return
            }
            guard let data = data else {
                print("No data returned from the data task")
                completion()
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people.append(contentsOf: personSearch.results)
            } catch {
                NSLog("Unable to decode data into [Person] object from api \(error)")
            }
            completion()
        }.resume()               // you can also use task.resume()
        
    }
    
}
