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
    var url: String
    var bio: String
    var publicRepos: Int
    var publicGists: Int
}

class Follower: Codable {
    var login: String
    var url: String
}
