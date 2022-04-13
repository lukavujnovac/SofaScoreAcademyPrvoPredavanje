//
//  SearchViewCell.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 12.04.2022..
//

import UIKit
import SDWebImage

class SearchViewCell: UICollectionViewCell {
    
    var userResult: User! {
        didSet {
            bioLabel.text = userResult.bio
            nameLabel.text = userResult.login
            followersLabel.text = String(userResult.followers)
            followingLabel.text = String(userResult.following)
            guard let url = URL(string: userResult.avatarUrl) else {return}
            avatarImageView.sd_setImage(with: url)
        }
    }
    
    private let avatarImageView: UIImageView = {
        let iv = UIImageView() //image view
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "github")
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Split, Croatia"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "following: 0"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.text = "followers: 0"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        addViews()
        setupConstraints()
        setupStackView()
    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { 
            $0.trailing.equalToSuperview().offset(-18)
            $0.top.equalToSuperview().offset(18)
        }
    }
    
    private func setupStackView() {
        let horizontalStackView = UIStackView(arrangedSubviews: [followingLabel, followersLabel])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 20
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel, horizontalStackView])
        addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.snp.makeConstraints { 
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalTo(avatarImageView.snp.leading).offset(10)
            $0.trailing.equalTo(avatarImageView.snp.trailing).offset(-18)
        }
    }
    
    private func addViews() {
        addSubviews(avatarImageView, bioLabel, nameLabel)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
