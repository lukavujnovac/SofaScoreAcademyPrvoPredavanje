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
    
    private let textMessages = MockData.textMessages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Poruke"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(SofaCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)   
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = textMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString

            let containerView = UIView()
            
            containerView.addSubview(label)
            
            label.snp.makeConstraints { 
                $0.centerX.equalTo(containerView.snp.centerX)
                $0.centerY.equalTo(containerView.snp.centerY)
            }
            
            return containerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SofaCell
        let chatMessage = textMessages[indexPath.section][indexPath.row]
        
        cell.chatMessage = chatMessage
        
        return cell
    }
}



