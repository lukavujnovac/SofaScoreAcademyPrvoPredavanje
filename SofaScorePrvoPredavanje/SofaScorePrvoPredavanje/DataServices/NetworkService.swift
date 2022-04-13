//
//  NetworkService.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 12.04.2022..
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    func getResults(user: String, completed: @escaping (Result<User, ErrorMessage>) -> Void) {
        let urlString = "https://api.github.com/users/\(user)"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                print(response)
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(User.self, from: data)
                
                completed(.success(results))
                
            }catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
