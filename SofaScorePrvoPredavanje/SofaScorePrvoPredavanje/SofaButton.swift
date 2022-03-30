//
//  SofaButton.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 29.03.2022..
//

import UIKit

class SofaButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(backgroundColor: UIColor, myTitle: String, titleColor: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitle(myTitle, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = 10
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false

        setTitleColor(.label, for: .normal)
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .systemBlue
    }
    
    @objc func buttonAction(sender: UIButton!) {
//        print("pressed")
    }
}

