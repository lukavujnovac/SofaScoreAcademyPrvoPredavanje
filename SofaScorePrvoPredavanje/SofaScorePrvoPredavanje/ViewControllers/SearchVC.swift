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
    
    private func createDismissKeyboardTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func pushVC() {
        guard let playerName = customTextField.text,
              !playerName.isEmpty else {
            
            let emptyTextFieldAlert = UIAlertController(title: "this can't be empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "dismiss", style: .destructive)
            
            emptyTextFieldAlert.addAction(action)
            present(emptyTextFieldAlert, animated: true, completion: nil)
            
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
        print("tapped return")
        pushVC()
        return true
    }
}
