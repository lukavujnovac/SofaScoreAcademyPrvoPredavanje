//
//  GitHubUsersVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit

class GitHubUsersVC: UIViewController, UISearchBarDelegate, UICollectionViewDataSource {
    private var username: String = ""
    private let searchBar = UISearchBar()
    private let cellIdentifier = "cell"
    
    var results: [Follower] = []
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBar)
        configureCollectionView()
        searchBar.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width / 2 - 18, height: view.frame.size.width / 2 - 18)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
        
        self.collectionView = collectionView

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 55, width: view.frame.size.width, height: view.frame.size.height - 55)
        
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width - 18, height: 50)
    }
    
    func fetchFollowers(text: String) {
        NetworkManager.shared.getFollowers(for: text, page: 1) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let followers):
                        print(followers)
                        if !followers.isEmpty {
                            self?.results = followers
                            self?.collectionView?.reloadData()
                            print(self?.results[0].url)
                        }else {
                            print("no followers")
                        }
                        
                    case .failure(let error):
                        print(error)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageUrlString = results[indexPath.row].avatarUrl
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .blue
        cell.configure(with: imageUrlString)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.searchBar.resignFirstResponder()
            if let text = searchBar.text {
                self.results = []
                self.collectionView?.reloadData()
                self.fetchFollowers(text: text)
            }
        }
    }
}
