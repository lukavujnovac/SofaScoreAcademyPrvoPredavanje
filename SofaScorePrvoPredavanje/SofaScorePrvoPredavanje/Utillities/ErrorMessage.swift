//
//  ErrorMessage.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 12.04.2022..
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "Invalid data. Try again."
    case invalidResponse = "Server error. Please modifiy your search and try again."
}
