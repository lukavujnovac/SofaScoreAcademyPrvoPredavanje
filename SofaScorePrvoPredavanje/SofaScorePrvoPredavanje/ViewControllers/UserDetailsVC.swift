//
//  JobDetailsViewController.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 12.04.2022..
//

import UIKit
import SnapKit
import SafariServices

class UserDetailsVC: UIViewController {
    
    private let avatarImageView = AspectFitImageView(image: UIImage(named: "github"), cornerRadius: 12)
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Luka Vujnovac"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .label
        
        return label
    }()
    
   private let bioLabel: UILabel = {     
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        
        return label
    }()
    
    private let followersButton: UIButton = {     
        let button = UIButton(type: .system)
        button.setTitle("Followers", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 18
        
        button.snp.makeConstraints { 
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        
        button.addTarget(UserDetailsVC.self, action: #selector(handleFollowers), for: .touchUpInside)
        
        return button
    }()
    
    private let followingButton: UIButton = {     
        let button = UIButton(type: .system)
        button.setTitle("Following", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 18
        
        button.snp.makeConstraints { 
            $0.width.equalTo(150)
        }
        
        button.addTarget(UserDetailsVC.self, action: #selector(handleFollowing), for: .touchUpInside)
        
        return button
    }()
    
//    var pinchGesture = UIPinchGestureRecognizer()
        
//        @objc func pinchText(sender: UIPinchGestureRecognizer) {
//            var pointSize = descriptionTextView.font?.pointSize
//            pointSize = ((sender.velocity > 0) ? 1 : -1) * 1 + pointSize!
//            descriptionTextView.font = UIFont( name: "arial", size: (pointSize)!)
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchText(sender:)))
        
        setupStackView()
    }
    
    private func setupStackView() {
        let horizontalStackView = UIStackView(arrangedSubviews: [followingButton, followersButton])
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 20
        
        let stackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel, bioLabel, horizontalStackView])
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { 
            $0.centerY.centerX.equalToSuperview()
        }
        
        stackView.spacing = 20
        stackView.axis = .vertical
    }
    
    @objc func handleFollowers() {
        //network call za followere da se prikazu na ekranu
        print("stisnia followers")
    }
    
    @objc func handleFollowing() {
        //network call za following da se prikaze na ekranu
        print("stisnia following")
    }
}
