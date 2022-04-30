//
//  GitHubError.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.04.2022..
//

import Foundation

enum GitHubError: String, Error {
    case invalidData = "Invalid data. Try again."
    case invalidUsername = "Username you entered is invalid. Try again."
    case unableToComplete = "Unable to complete query. Try again."
    case invalidResponse = "Server error. Please modify your search and try again."
}
