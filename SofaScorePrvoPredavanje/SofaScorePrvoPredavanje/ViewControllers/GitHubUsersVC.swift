//
//  GitHubUsersVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit

class GitHubUsersVC: UIViewController, UISearchBarDelegate {
    private var username: String = ""
    private let searchBar = UISearchBar()
    private let button = UIButton()
    
    var followersx: [Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        view.backgroundColor = .systemBackground
        
        addViews()
        configureButton()
        setupConstraints()
    }
    
    private func addViews() {
        view.addSubviews(searchBar, button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width - 20, height: 50)
    }
    
    func fetchFollowers(text: String) {
        NetworkManager.shared.getFollowers(for: text, page: 1) { [weak self] result in
            switch result {
                case .success(let followers):
//                    print(followers)
                    if !followers.isEmpty {
                        self?.followersx = followers
                        print(self?.followersx[0].url)
                    }else {
                        print("no followers")
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    @objc private func didTapButton() {
        let navVC = UINavigationController(rootViewController: UserDetailVC())
        fetchFollowers(text: searchBar.text ?? "")
        
        //collection view svih ljudi da ga mos kasnije reuse za followere
        
        present(navVC, animated: true)
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if let text = searchBar.text {
//            fetchFollowers(text: text)
//        }
//    }
    
    private func configureButton() {
        button.setTitle("Find User", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemPurple
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        button.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(52)
        }
    }
}
