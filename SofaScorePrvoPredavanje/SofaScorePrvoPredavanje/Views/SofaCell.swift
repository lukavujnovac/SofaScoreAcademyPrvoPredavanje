//
//  SofaCell.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 04.04.2022..
//

import UIKit

class SofaCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        styleViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
    }
    
    private func styleViews() {
        bubbleBackgroundView.backgroundColor = .systemGreen
        bubbleBackgroundView.layer.cornerRadius = 15
        
        messageLabel.numberOfLines = 0
    }
    
    private func setUpConstraints() {
        messageLabel.snp.makeConstraints { 
            $0.top.equalToSuperview().offset(32)
            $0.bottom.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(32)
            $0.width.equalTo(250)
        }
        
        bubbleBackgroundView.snp.makeConstraints {  
            $0.top.equalTo(messageLabel.snp.top).offset(-16)
            $0.leading.equalTo(messageLabel.snp.leading).offset(-16)
            $0.bottom.equalTo(messageLabel.snp.bottom).offset(16)
            $0.trailing.equalTo(messageLabel.snp.trailing).offset(16)
        }
    }
}
