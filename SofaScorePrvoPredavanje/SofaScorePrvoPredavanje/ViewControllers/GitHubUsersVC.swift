//
//  GitHubUsersVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit
import SwiftUI

class GitHubUsersVC: UIViewController, UISearchBarDelegate {
    
    private var username: String = ""
    
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        view.backgroundColor = .systemBackground
        
        addViews()
        setupConstraints()
    }
    
    func addViews() {
        view.addSubviews(searchBar)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width - 20, height: 50)
    }
    
    func fetchFollowers(text: String) {
        NetworkManager.shared.getFollowers(for: text, page: 1) { [weak self] result in
            switch result {
                case .success(let followers):
                    print(followers[0].url)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            fetchFollowers(text: text)
        }
    }
    
    func setupConstraints() {
        
    }
}
