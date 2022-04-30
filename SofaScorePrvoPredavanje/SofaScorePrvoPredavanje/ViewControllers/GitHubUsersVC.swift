//
//  GitHubUsersVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit

class GitHubUsersVC: UIViewController {
    
    private var username: String = "teovladusic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            switch result {
                case .success(let followers):
                    print(followers[0].url)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
