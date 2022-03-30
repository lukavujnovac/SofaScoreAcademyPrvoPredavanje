//
//  ProfileVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 10.03.2022..
//
import UIKit
import SnapKit

class ProfileVC: UIViewController {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let appNameTitleLabel = UILabel()
    private let appNameLabel = UILabel()
    private let apiCreditTitleLabel = UILabel()
    private let apiCreditLabel = UILabel()
    private let developerTitleLabel = UILabel()
    private let developerLabel = UILabel()
    private let sofaScoreLabel = UILabel()
    private let appleLogoImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubviews()
        styleViews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubviews(
            titleLabel,
            subtitleLabel,
            appNameLabel,
            appNameTitleLabel,
            apiCreditLabel,
            apiCreditTitleLabel,
            developerLabel,
            developerTitleLabel,
            sofaScoreLabel, 
            appleLogoImage)
    }
    
    private func styleViews() {
        titleLabel.text = "SofaScore Academy"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        subtitleLabel.text = "Class 2022"
        subtitleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 20, weight: .light)
        
        appNameTitleLabel.text = "App Name"
        appNameTitleLabel.textColor = .black
        appNameTitleLabel.font = .systemFont(ofSize: 15, weight: .thin)
        
        appNameLabel.text = "Super Cool Weather App"
        appNameLabel.textColor = .black
        appNameLabel.font = .systemFont(ofSize: 20, weight: .light)
        
        apiCreditTitleLabel.text = "API credit"
        apiCreditTitleLabel.textColor = .black
        apiCreditTitleLabel.font = .systemFont(ofSize: 15, weight: .thin)
        
        apiCreditLabel.text = "metaweather"
        apiCreditLabel.textColor = .black
        apiCreditLabel.font = .systemFont(ofSize: 20, weight: .light)
        
        developerTitleLabel.text = "Developer"
        developerTitleLabel.textColor = .black
        developerLabel.font = .systemFont(ofSize: 15, weight: .thin)
        
        developerLabel.text = "Luka Vujnovac"
        developerLabel.textColor = .black
        developerLabel.font = .systemFont(ofSize: 20, weight: .light)
        
        sofaScoreLabel.text = "SofaScore"
        sofaScoreLabel.textColor = .black
        sofaScoreLabel.font = .systemFont(ofSize: 30, weight: .black)
        
        appleLogoImage.image = UIImage(systemName: "applelogo")
        appleLogoImage.tintColor = .black
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { 
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(20)
        }
        
        subtitleLabel.snp.makeConstraints { 
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        sofaScoreLabel.snp.makeConstraints { 
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            $0.height.equalTo(50)
        }
        
        appleLogoImage.snp.makeConstraints { 
            $0.leading.equalTo(sofaScoreLabel.snp.trailing)
            $0.width.height.equalTo(50)
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(50)
        }
        
        appNameTitleLabel.snp.makeConstraints{
            $0.top.equalTo(sofaScoreLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        appNameLabel.snp.makeConstraints{
            $0.top.equalTo(appNameTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        apiCreditTitleLabel.snp.makeConstraints{
            $0.top.equalTo(appNameLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        apiCreditLabel.snp.makeConstraints{
            $0.top.equalTo(apiCreditTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        developerTitleLabel.snp.makeConstraints{
            $0.top.equalTo(apiCreditLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        developerLabel.snp.makeConstraints{
            $0.top.equalTo(developerTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
