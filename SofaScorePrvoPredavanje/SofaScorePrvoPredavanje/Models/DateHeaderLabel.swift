//
//  DateHeaderLabel.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 05.04.2022..
//

import UIKit

class DateHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        textColor = .black
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        let width = originalContentSize.width + 16
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        
        return CGSize(width: width, height: height)
    }
}
