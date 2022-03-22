//
//  SearchVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 10.03.2022..
//

import UIKit

class SearchVC: ViewController {
    var image1: UIImageView!
    var image2: UIImageView!
    var image3: UIImageView!
    var image4: UIImageView!
    var image5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        buildViews()
    }
    
    private func buildViews() {
        buildCornerViews()
        buildCenterView()
    }
    
    private func buildCornerViews() {
        createCornerViews()
        styleCornerView()
        positionCornerViews()
    }
    
    private func buildCenterView() {
        createCenterView()
        styleCenterView()
        positionCenterView()
    }
    
    private func createCornerViews() {
        image1 = UIImageView()
        view.addSubview(image1)
        
        image2 = UIImageView()
        view.addSubview(image2)
        
        image3 = UIImageView()
        view.addSubview(image3)
        
        image4 = UIImageView()
        view.addSubview(image4)
    }
    
    private func createCenterView() {
        image5 = UIImageView()
        view.addSubview(image5)
    }
    
    private func styleCornerView() {
        image1.image = UIImage(systemName: "circle")
        image1.tintColor = .systemRed
        
        image2.image = UIImage(systemName: "circle")
        image2.tintColor = .systemRed
        
        image3.image = UIImage(systemName: "circle")
        image3.tintColor = .systemRed
        
        image4.image = UIImage(systemName: "circle")
        image4.tintColor = .systemRed
    }
    
    private func styleCenterView() {
        image5.image = UIImage(systemName: "checkmark.circle.fill")
        image5.tintColor = .systemBlue
    }
    
    private func positionCornerViews() {
        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        image3.translatesAutoresizingMaskIntoConstraints = false
        image4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            image1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            image1.heightAnchor.constraint(equalToConstant: 100),
            image1.widthAnchor.constraint(equalToConstant: 100),
            
            image2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            image2.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            image2.heightAnchor.constraint(equalToConstant: 100),
            image2.widthAnchor.constraint(equalToConstant: 100),
            
            image3.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            image3.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            image3.heightAnchor.constraint(equalToConstant: 100),
            image3.widthAnchor.constraint(equalToConstant: 100),
            
            image4.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            image4.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            image4.heightAnchor.constraint(equalToConstant: 100),
            image4.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func positionCenterView() {
        image5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image5.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            image5.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            image5.heightAnchor.constraint(equalToConstant: 100),
            image5.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
