//
//  ProfileVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 10.03.2022..
//
import UIKit
import SnapKit

class ProfileVC: UITableViewController {
    
    private let cellId = "id"
    let textMessages: [String] = ["here is my first message", "I will message another long message that will word wrap", "I will message another long message that will word wrap I will message another long message that will word wrap"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Poruke"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(SofaCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SofaCell
//        cell.textLabel?.text = "kdsjfld"
//        cell.textLabel?.numberOfLines = 0
        cell.messageLabel.text = textMessages[indexPath.row]
        
        return cell
    }
}
