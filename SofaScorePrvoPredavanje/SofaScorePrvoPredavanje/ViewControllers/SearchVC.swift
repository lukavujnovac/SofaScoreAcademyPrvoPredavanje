//
//  SearchVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 10.03.2022..
//
import UIKit
import SnapKit

class SearchVC: UIViewController {
    private let imageView = UIImageView()
    private let customTextField = SofaTextField()
    private let myCoolButton = SofaButton(backgroundColor: .systemGreen, myTitle: "Odaberi Igraca", titleColor: .systemBlue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        addViews()
        styleViews()
        setupConstraints()
        createDismissKeyboardTapGesture()
        customTextField.delegate = self
        
    }
    
    private func addViews() {
        view.addSubviews(myCoolButton, customTextField, imageView)
    }
    
    private func pushVC() {
        guard let playerName = customTextField.text,
              !playerName.isEmpty else {
            
            let emptytextFieldAlertController = UIAlertController(title: "Empty Player Name", message: "Please enter player's name. We need to know who to look for 😀.", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "OK", style: .cancel)
            emptytextFieldAlertController.view.tintColor = .red
            emptytextFieldAlertController.addAction(dismissAction)
            self.present(emptytextFieldAlertController, animated: true, completion:{})
            
                                              
//            let emptytextFieldAlertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
//
//            let margin:CGFloat = 10.0
//            let rect = CGRect(x: margin, y: margin, width: emptytextFieldAlertController.view.bounds.size.width - margin * 4.0, height: 120)
//            let customView = UIView(frame: rect)
//            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: emptytextFieldAlertController.view.bounds.size.width - 20, height: 21))
//            let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: emptytextFieldAlertController.view.bounds.size.width - 20, height: 16))
//            
//            titleLabel.textAlignment = .center
//            titleLabel.text = "Empty Player Name"
//            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
//            
//            subtitleLabel.textAlignment = .center
//            subtitleLabel.text = "Please Enter player's name. We need to know who to look for 😀."
//            subtitleLabel.font = .systemFont(ofSize: 15, weight: .light)
//            
//            
//            customView.addSubviews(titleLabel, subtitleLabel)
//            
//            emptytextFieldAlertController.view.addSubview(customView)
//
//            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
//
//            emptytextFieldAlertController.addAction(cancelAction)
//
//            self.present(emptytextFieldAlertController, animated: true, completion:{})
            
            return
        }
        let profileVC = ProfileVC()
        profileVC.title = customTextField.text
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func styleViews() {
        
        customTextField.backgroundColor = .lightGray
        customTextField.textColor = .label
        customTextField.placeholder = "Type here..."
        customTextField.placeholderColor = .white
        
        imageView.image = UIImage(systemName: "magnifyingglass.circle.fill")
        imageView.tintColor = .systemBlue
        
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { 
            $0.top.equalToSuperview().offset(100)
            $0.width.height.equalTo(50)
            $0.centerX.equalToSuperview().offset(-100)
        }
        
        customTextField.snp.makeConstraints {
            $0.bottom.equalTo(myCoolButton.snp.top).offset(-20)
            $0.top.equalTo(imageView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.equalTo(40)
            $0.width.equalTo(300)
        }
        
        myCoolButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
        }
    }
}


extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushVC()
        return true
    }
    
    func createDismissKeyboardTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
}
