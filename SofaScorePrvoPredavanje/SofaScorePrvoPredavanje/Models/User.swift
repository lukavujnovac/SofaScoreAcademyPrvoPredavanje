//
//  Result.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 12.04.2022..
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var followers: Int
    var following: Int
    var bio: String
}
