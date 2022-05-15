//
//  SearchViewCell.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 02.05.2022..
//

import UIKit
import SnapKit

class SearchViewCell: UICollectionViewCell {
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.image = UIImage(named: "avatar")
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "lukavujnovac"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "software dev"
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.numberOfLines = 0
        label.textColor = .label
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addViews()
        setupConstraints()
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.snp.makeConstraints { 
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalTo(avatarImageView.snp.leading).offset(18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubviews(avatarImageView)
    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { 
            $0.trailing.equalToSuperview().offset(-18)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(50)
        }
    }
}
