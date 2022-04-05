//
//  ProfileVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 10.03.2022..
//
import UIKit
import SnapKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
}

class ProfileVC: UITableViewController {
    
    private let cellId = "id"
    
    let textMessages: [ChatMessage] = [
        ChatMessage(text: "here is my first message", isIncoming: false),
        ChatMessage(text: "I will message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "I will message another long message that will word wrap I will message another long message that will word wrap", isIncoming: true)
    ]    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Poruke"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(SofaCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SofaCell
        let chatMessage = textMessages[indexPath.row]
        
        cell.chatMessage = chatMessage
        
        return cell
    }
}
