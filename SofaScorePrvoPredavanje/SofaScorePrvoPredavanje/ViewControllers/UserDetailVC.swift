//
//  UserDetailVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import UIKit

class UserDetailVC: UIViewController {
    private var profileImageView = GitHubAvatarImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addViews()
        styleViews()
        setupConstraints()
    }
    
    func addViews() {
        view.addSubview(profileImageView)
    }
    
    func styleViews() {
        profileImageView.image = UIImage(systemName: "person")
        profileImageView.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { 
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.width.height.equalTo(50)
        }
    }
}
