//
//  User.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import Foundation

class User: Codable {
    var login: String
    var avatarUrl: String
    var followers: Int
    var following: Int
    var bio: String
}

class Follower: Codable {
    var login: String
}
