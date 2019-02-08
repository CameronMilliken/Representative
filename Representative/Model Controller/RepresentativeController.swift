//
//  RepresentativeController.swift
//  Representative
//
//  Created by Cameron Milliken on 2/7/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    //Properties
    static let baseURL = URL(string: "https://whoismyrepresentative.com")
    
    //Fetching
    // URL https://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    static func searchRepresentatives(state: String, completion: @escaping ([Representative]) -> Void) {
        guard var url = baseURL else {completion([]) ; return }
        url.appendPathComponent("getall_reps_bystate")
        url.appendPathExtension("php")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let stateQueryItem = URLQueryItem(name: "state", value: state)
        let outputQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [stateQueryItem, outputQueryItem]
        guard let requestUrl = components?.url else { completion([]) ; return }
        print(requestUrl.absoluteString)
        
        var request = URLRequest(url: requestUrl)
        request.httpBody = nil
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("🤬 Error fetching from URL \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data,
                let repsonseDataString = String(data : data, encoding: .ascii),
                let fixedData = repsonseDataString.data(using: .utf8) else { completion([]) ; return }
            
            let jsonDecoder = JSONDecoder()
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: fixedData)
                let representatives = topLevelDictionary.results
                completion(representatives)
            } catch {
                print("🤦🏻‍♂️ Error decoding data: \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
}//End of class
