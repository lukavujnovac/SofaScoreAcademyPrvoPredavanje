//
//  UserDetailVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit
import SafariServices

class UserDetailVC: UIViewController {
    private var avatarView = GitHubAvatarImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    private var usernameView = UILabel()
    private var bioView = UILabel()
    private var reposView = UILabel()
    private var gistsView = UILabel()
    private var profileURLButton = UIButton()
    private var followersView = UILabel()
    private var followingView = UILabel()
    private var followersButtonView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addViews()
        styleViews()
        setupConstraints()
    }
    
    private func addViews() {
        view.addSubviews(avatarView, usernameView, bioView, reposView, gistsView, profileURLButton, followingView, followersView, followersButtonView) //, profileStackView, followersStackView)
    }
    
    private func styleViews() {
        styleAvatarView()
        styleUsernameView()
        styleBioView()
        styleGistsView()
        styleReposView()
        styleProfileButton()
    }
    
    private func setupConstraints() {
        setupAvatarViewConstraints()
        setupUsernameViewConstraints()
        setupBioViewConstraints()
        setupReposViewConstraints()
        setupGistsViewCOnstraints()
        setupProfileButtonConstraints()
        //setupProfileContainerViewConstraints()
        //setupFollowersContainerViewConstraints()
    }
    
    @objc func handleProfileURL() {
        guard let url = URL(string: "https://github.com/lukavujnovac") else {return}
        let svc = SFSafariViewController(url: url)
        self.present(svc, animated: true)
    }
}



private extension UserDetailVC {
    func styleAvatarView() {
        avatarView.image = UIImage(systemName: "person")
        avatarView.layer.cornerRadius = 10
        avatarView.layer.shadowRadius = 5
    }
    
    func styleUsernameView() {
        usernameView.text = "lukavujnovac"
        usernameView.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func styleBioView() {
        bioView.text = "software dev"
        bioView.font = UIFont.systemFont(ofSize: 17, weight: .thin)
    }
    
    func styleReposView() {
        reposView.text = "Public Repos: 10"
        reposView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    func styleGistsView() {
        gistsView.text = "Public Gists: 0"
        gistsView.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    func styleProfileButton() {
        profileURLButton.setTitle("Visit GitHub Profile", for: .normal)
        profileURLButton.setTitleColor(.label, for: .normal)
        profileURLButton.backgroundColor = .systemPurple
        profileURLButton.layer.cornerRadius = 10
                    
        profileURLButton.addTarget(self, action: #selector(handleProfileURL), for: .touchUpInside)
    }
    
//    func styleProfileStackView() {
//        profileStackView.axis = .vertical
//        profileStackView.spacing = 18
//    }
//    
//    func styleFollowersStackView() {
//        followersStackView.axis = .vertical
//        profileStackView.spacing = 18
//    }
}

private extension UserDetailVC {
    func setupAvatarViewConstraints() {
        avatarView.snp.makeConstraints { 
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.width.height.equalTo(50)
        }
    }
    
    func setupUsernameViewConstraints() {
        usernameView.snp.makeConstraints {         
            $0.leading.equalTo(avatarView.snp.trailing).offset(18)
            $0.top.equalTo(avatarView.snp.top).offset(5)
        }
    }
    
    func setupBioViewConstraints() {
        bioView.snp.makeConstraints { 
            $0.top.equalTo(avatarView.snp.bottom).offset(18)
            $0.leading.equalTo(avatarView)
        }
    }
    
    func setupReposViewConstraints() {
        reposView.snp.makeConstraints { 
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(bioView.snp.bottom).offset(24)
        }
    }
    
    func setupGistsViewCOnstraints() {
        gistsView.snp.makeConstraints { 
            $0.trailing.equalToSuperview().offset(-36)
            $0.top.equalTo(bioView.snp.bottom).offset(24)
        }
    }
    
    func setupProfileButtonConstraints() {
        profileURLButton.snp.makeConstraints { 
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.top.equalTo(gistsView.snp.bottom).offset(18)
            $0.width.equalTo(200)
            $0.height.equalTo(52)
        }
    }
}

//private extension UserDetailVC {
//    func configureProfileStackView() {
        
//        let urlButtonView: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("Visit GitHub Profile", for: .normal)
//            button.setTitleColor(.label, for: .normal)
//            button.backgroundColor = .systemPurple
//            button.layer.cornerRadius = 10
//            
//            button.addTarget(self, action: #selector(handleProfileURL), for: .touchUpInside)
//            
//            return button
//        }()
//        profileStackView.addSubviews(gistsView, reposView, urlButtonView)
//        
//        reposView.text = "Public Repos: 50"
//        gistsView.text = "Public Gists: 0"
//        
//        reposView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        gistsView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        
//        reposView.snp.makeConstraints{
//            $0.leading.equalToSuperview().offset(18)
//            $0.top.equalToSuperview().offset(18)
//        }
//        
//        gistsView.snp.makeConstraints{
//            $0.trailing.equalToSuperview().offset(-18)
//            $0.top.equalTo(reposView)
//        }
//        
//        urlButtonView.snp.makeConstraints { 
//            $0.top.equalTo(gistsView.snp.bottom).offset(18)
//            $0.width.equalToSuperview().offset(-40)
//            $0.height.equalTo(40)
//            $0.centerX.equalToSuperview()
//        }
//        
//    }
//    
    
//    
//    func configureFollowersStackView() {
        
//        
//        followersStackView.addSubviews(followingView, followersView, buttonView)
//        
//        followersView.text = "Followers: 0"
//        followingView.text = "Following: 0"
//        buttonView.setTitle("Show Followers", for: .normal)
//        buttonView.setTitleColor(.label, for: .normal)
//        buttonView.backgroundColor = .systemBlue
//        buttonView.layer.cornerRadius = 10
//        buttonView.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        
//        followersView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        followingView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        
//        followersView.snp.makeConstraints{
//            $0.leading.equalToSuperview().offset(18)
//            $0.top.equalToSuperview().offset(18)
//        }
//        
//        followingView.snp.makeConstraints{
//            $0.trailing.equalToSuperview().offset(-18)
//            $0.top.equalTo(followersView)
//        }
//        
//        buttonView.snp.makeConstraints { 
//            $0.top.equalTo(followingView.snp.bottom).offset(18)
//            $0.width.equalToSuperview().offset(-40)
//            $0.height.equalTo(40)
//            $0.centerX.equalToSuperview()
//        }
//    }
//    @objc private func didTapButton() {
//        let rootVC = UIViewController()
//        rootVC.title = "welcome"
//        let navVC = UINavigationController(rootViewController: rootVC)
//        
//        present(navVC, animated: true)
//    }
//}
