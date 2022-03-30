//
//  UIView+Extenstion.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 29.03.2022..
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
