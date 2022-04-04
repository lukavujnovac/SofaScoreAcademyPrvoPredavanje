//
//  SofaTextField.swift
//  SofaScorePrvoPredavanje
//
//  Created by Luka Vujnovac on 30.03.2022..
//

import UIKit

class SofaTextField: UITextField {
    
    var placeholderColor: UIColor = UIColor.lightGray {
        didSet{
            self.setPlaceholderColor()
        }
    }
    
    var textPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    var backgrounColor: UIColor = .systemBlue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.rightViewMode = .always
        self.clearButtonMode = .whileEditing
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidEndOnExit)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 5
    }
    
    private func setPlaceholderColor() {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            if (textField.text!.isEmpty)
            {
                self.layer.borderColor = UIColor.systemRed.cgColor
//                placeholder?.description = "can't be empty"
            }
            else
            {
                self.layer.borderColor = UIColor.black.cgColor
            }
        }
}
