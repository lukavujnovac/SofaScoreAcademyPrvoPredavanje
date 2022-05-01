//
//  UserDetailVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit
import SwiftUI

class UserDetailVC: UIViewController {
    private var avatarView = GitHubAvatarImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    private var usernameView = UILabel()
    private var bioView = UILabel()
    private var profileStackView = UIStackView()
    private var followersStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addViews()
        styleViews()
        setupConstraints()
        configureProfileContainerView()
        configureFollowersContainerView()
    }
    
    private func addViews() {
        view.addSubviews(avatarView, usernameView, bioView, profileStackView, followersStackView)
    }
    
    private func configureProfileContainerView() {
        let reposView = UILabel()
        let gistsView = UILabel()
        let buttonView = UIButton()
        
        profileStackView.addSubviews(gistsView, reposView, buttonView)
        
        reposView.text = "Public Repos: 50"
        gistsView.text = "Public Gists: 0"
        buttonView.setTitle("View Profile", for: .normal)
        buttonView.setTitleColor(.label, for: .normal)
        buttonView.backgroundColor = .systemPurple
        buttonView.layer.cornerRadius = 10
        
        reposView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        gistsView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        reposView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(18)
        }
        
        gistsView.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-18)
            $0.top.equalTo(reposView)
        }
        
        buttonView.snp.makeConstraints { 
            $0.top.equalTo(gistsView.snp.bottom).offset(18)
            $0.width.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    private func configureFollowersContainerView() {
        let followersView = UILabel()
        let followingView = UILabel()
        let buttonView = UIButton()
        
        followersStackView.addSubviews(followingView, followersView, buttonView)
        
        followersView.text = "Followers: 0"
        followingView.text = "Following: 0"
        buttonView.setTitle("Show Followers", for: .normal)
        buttonView.setTitleColor(.label, for: .normal)
        buttonView.backgroundColor = .systemBlue
        buttonView.layer.cornerRadius = 10
        
        followersView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        followingView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        followersView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(18)
        }
        
        followingView.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-18)
            $0.top.equalTo(followersView)
        }
        
        buttonView.snp.makeConstraints { 
            $0.top.equalTo(followingView.snp.bottom).offset(18)
            $0.width.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    
    private func styleViews() {
        avatarView.image = UIImage(systemName: "person")
        avatarView.layer.cornerRadius = 10
        avatarView.layer.shadowRadius = 5
        
        usernameView.text = "lukavujnovac"
        usernameView.font = UIFont.boldSystemFont(ofSize: 20)
        
        bioView.text = "software dev"
        bioView.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        
        profileStackView.axis = .vertical
        profileStackView.spacing = 18
        
        followersStackView.axis = .vertical
    }
    
    private func setupConstraints() {
        setupAvatarViewConstraints()
        setupUsernameViewConstraints()
        setupBioViewConstraints()
        setupProfileContainerViewConstraints()
        setupFollowersContainerViewConstraints()
    }
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
    
    func setupProfileContainerViewConstraints() {
        profileStackView.snp.makeConstraints { 
            $0.top.equalTo(bioView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(18)
        }
    }
    
    func setupFollowersContainerViewConstraints() {
        followersStackView.snp.makeConstraints { 
            $0.top.equalTo(profileStackView.snp.bottom).offset(150)
            $0.leading.trailing.equalToSuperview().inset(18)
        }
    }
}
