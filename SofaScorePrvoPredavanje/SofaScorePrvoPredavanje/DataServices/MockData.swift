//
//  MockData.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 05.04.2022..
//

import Foundation

class MockData: DataServiceProtocol {
    static var textMessages = [[
        ChatMessage(text: "zbog razgovora na proslom predavanju o whatsApp chatu", isIncoming: false, date: Date.dateFromCustomString(customString: "03/04/2022")),
        ChatMessage(text: "odlucio sam replicirati jedan chat", isIncoming: false, date: Date.dateFromCustomString(customString: "03/04/2022"))
    ], 
    [
        ChatMessage(text: "jako duga poruka tako da mi dode skroz do drugog reda da vidim radi li autosizing. Mozda dode i do treceg reda", isIncoming: true, date: Date.dateFromCustomString(customString: "04/04/2022")),
        ChatMessage(text: "par", isIncoming: true, date: Date.dateFromCustomString(customString: "04/04/2022")),
        ChatMessage(text: "kratkih", isIncoming: true, date: Date.dateFromCustomString(customString: "04/04/2022")),
        ChatMessage(text: "poruka", isIncoming: true, date: Date.dateFromCustomString(customString: "04/04/2022")),
    ],
    [
        ChatMessage(text: "pritisni plus za magiju", isIncoming: false, date: Date.dateFromCustomString(customString: "05/04/2022"))
    ]
    ]
    
}



