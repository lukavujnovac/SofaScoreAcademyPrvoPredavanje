//
//  NetworkVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 12.04.2022..
//

import UIKit
import SnapKit

class NetworkVC: UIViewController, UISearchBarDelegate {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var userResults: User?
    
    private let userCell = SearchViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "GitHub Users"
        addViews()
        setUpSearchBar()
        setupConstraints()
        
        
        NetworkService.shared.getResults(user: "Anteprpic") { [weak self] result in
            switch result {
                case .success(let results):
                    print(result)
                    self?.userResults = results
                    
                    DispatchQueue.main.async {
                        self?.loadView()
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    private func addViews() {
        view.addSubview(userCell)
    }
    
    
    private func setupConstraints() {
        userCell.snp.makeConstraints { 
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
    
    private func pushVC() {
        let vc = UserDetailsVC()
        navigationController?.pushViewController(vc, animated: true)
        
//        present(vc, animated: true)
    }
    
//    private func setupConstraints() {
//        citySearchBar.snp.makeConstraints { 
//            $0.centerX.equalToSuperview().offset(10)
//            $0.centerY.equalTo(searchController.searchBar.frame.height).offset(50)
//            $0.height.equalTo(50)
//            $0.width.equalToSuperview()
//        }
//    }
}

extension NetworkVC: UICollectionViewDelegateFlowLayout {
    
}
