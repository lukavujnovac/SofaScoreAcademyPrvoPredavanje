//
//  UserSearchVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 13.04.2022..
//

import UIKit

class UserSearchVC: UIViewController, UISearchBarDelegate {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var userResult: User?
    private let userView = SearchViewCell() 
    
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setUpSearchBar()
        addViews()
        styleViews()
        addConstraints()
        
        NetworkService.shared.getResults(user: "Anteprpic") { [weak self] user in
            switch user {
                case .success(let userx):
                    print(userx)
                    self?.userResult = userx
                    DispatchQueue.main.async {
                        self?.loadView()
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    private func addViews() {
        view.addSubviews(imageView, userView)
    }
    
    private func styleViews() {
        imageView.image = UIImage(systemName: "magnifyingglass.circle")
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints { 
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(150)
        }
        
        userView.snp.makeConstraints { 
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    private func setUpSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        searchController.searchBar.delegate = self
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .black
        textFieldInsideSearchBar?.placeholder = "User"
    }
}
