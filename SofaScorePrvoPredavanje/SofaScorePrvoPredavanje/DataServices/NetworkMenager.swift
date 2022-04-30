//
//  NetworkMenager.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit
///users/" + "\(username)" + "/followers?per_page=100&page=\(page)
//
//struct APIResponse: Codable {
//    let total: Int
//    let total_pages: Int
//    let users: [User]
//}

//+ "/followers?per_page=100&page=\(page)

class NetworkManager {
    
    // singleton --> every network manager will have access to it
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GitHubError>) -> Void ) {
        let endpoint = K.apiUrl + "/users/" + "\(username)/followers"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                print(response)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                print(response)
                return
            }
            guard let data = data else {
                completed(.failure(.unableToComplete))
                print(data)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GitHubError>) -> Void) {
    
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
