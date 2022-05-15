//
//  GitHubAPIVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 02.05.2022..
//

import UIKit

class GitHubAPIVC: UICollectionViewController, UISearchBarDelegate {
    private let cellId = "searchCellID"
    private let searchController = UISearchController(searchResultsController: nil)
//    let userSearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GitHubJobs API"
        collectionView.backgroundColor = .systemGray
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        
        configureSearchBar()
    }
    
    private func configureSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        searchController.searchBar.delegate = self
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .black
        textFieldInsideSearchBar?.placeholder = "Username"
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 1, bottom: 10, right: 1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell
        cell.layer.cornerRadius = 12
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = UserDetailVC()
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 18, height: 180)
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GitHubAPIVC: UICollectionViewDelegateFlowLayout {
    
}
