//
//  SearchVC.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 10.03.2022..
//
import UIKit
import SnapKit

class SearchVC: UIViewController {

    let imageView = UIImageView()
    let secondImageView = UIImageView()
    let appleLabel = UILabel()
    let textField = UITextField()
    let appleButton = UIButton()
    let myCoolButton = SofaButton(backgroundColor: .systemRed, mojTitle: "Klikni me")


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        addViews()
        styleViews()
        setupConstraints()
        createDismissKeyboardTapGesture()
        textField.delegate = self
    }

    private func addViews() {
        view
            .addSubviews(imageView,
                         secondImageView,
                         appleLabel,
                         myCoolButton,
                         textField)
    }

    private func createDismissKeyboardTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func pushVC() {
        guard let playerName = textField.text,
              !playerName.isEmpty else {
            return
            // napravit alert view controller
        }
        let profileVC = ProfileVC()
        profileVC.title = textField.text
        navigationController?.pushViewController(profileVC, animated: true)
    }

    private func styleViews() {
        imageView.image = .checkmark
        secondImageView.image = .actions

        appleLabel.text = "Ja sam pametni label, stvorio me apple"
        appleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        appleLabel.numberOfLines = 2

        textField.backgroundColor = .secondaryLabel
        textField.textColor = .label
        //        textField.returnKeyType = .retu
        //        textField.keyboardType = .decimalPad
        //        textField.returnKeyTy
        //        appleLabel.textAlignment = .
    }

    private func setupConstraints() {
        appleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.bottom.equalTo(imageView.snp.top).offset(-50)
        }

        myCoolButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(200)
        }

        textField.snp.makeConstraints {
            $0.top.equalTo(myCoolButton.snp.bottom).offset(20)
            $0.centerX.equalTo(imageView.snp.centerX)
            $0.width.equalTo(300)
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
