//
//  GitHubUsersVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit

class GitHubUsersVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: "AntePrpic", page: 1) { [weak self] result in
            switch result {
                case .success(let followers):
                    print(followers)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
