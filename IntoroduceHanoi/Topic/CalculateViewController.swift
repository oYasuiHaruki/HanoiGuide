//
//  CalculateViewController.swift
//  IntoroduceHanoi
//
//  Created by 安井春輝 on 10/2/30 H.
//  Copyright © 30 Heisei haruki yasui. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    
    
    let vietnamMoneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HiraMaruProN-W4", size: 20)
        label.textColor = UIColor.white
        label.text = "ベトナムのお金"
        return label
    }()
    
    lazy var vietnamMoneyInput: UITextField! = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.font = UIFont(name: "HiraMaruProN-W4", size: 20)
        textField.textColor = UIColor.gray
        textField.textAlignment = NSTextAlignment.center
        textField.backgroundColor = UIColor.white
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    let japanMoneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HiraMaruProN-W4", size: 20)
        label.textColor = UIColor.white
        label.text = "日本のお金"
        return label
    }()
    
    lazy var japanMoneyInput: UITextField! = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.font = UIFont(name: "HiraMaruProN-W4", size: 20)
        textField.textColor = UIColor.gray
        textField.textAlignment = NSTextAlignment.center
        textField.backgroundColor = UIColor.white
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == japanMoneyInput {
            if let japanMoney = Int(japanMoneyInput.text!) {
                var vietnamMoney = japanMoney * 200
                vietnamMoneyInput.text = String(vietnamMoney)
            } else {
                print("換金できなかった。。")
            }
        } else if textField == vietnamMoneyInput {
            if let vietnamMoney = Int(vietnamMoneyInput.text!) {
                var japaneMoney = vietnamMoney/200
                japanMoneyInput.text = String(japaneMoney)
            } else {
                print("換金できなかった。。")
            }
        } else {
            print("cannot exchange...")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == japanMoneyInput {
            
            if let japanMoney = Int(japanMoneyInput.text!) {
                var vietnamMoney = japanMoney * 200
                vietnamMoneyInput.text = String(vietnamMoney)
            }
            
        } else if textField == vietnamMoneyInput {
            if let vietnamMoney = Int(vietnamMoneyInput.text!) {
                var japaneMoney = vietnamMoney/200
                japanMoneyInput.text = String(japaneMoney)
            }
        }
        
    }
    
    
    let moneyExchangeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont(name: "HiraMaruProN-W4", size: 20)
//        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setImage(UIImage(named: "exchange"), for: .normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(exchangeMoney), for: .touchUpInside)
        return button
    }()

    @objc func exchangeMoney() {
        if let vietnamMoney = Int(vietnamMoneyInput.text!) {
            var japaneMoney = vietnamMoney/200
            japanMoneyInput.text = String(japaneMoney)
        } else {
            print("換金できなかった。。")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(vietnamMoneyLabel)
        self.view.addSubview(vietnamMoneyInput)
        vietnamMoneyInput.delegate = self
        self.view.addSubview(japanMoneyLabel)
        self.view.addSubview(japanMoneyInput)
        japanMoneyInput.delegate = self
        self.view.addSubview(moneyExchangeButton)
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)

    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        vietnamMoneyLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        vietnamMoneyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        vietnamMoneyLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        vietnamMoneyInput.topAnchor.constraint(equalTo: vietnamMoneyLabel.bottomAnchor).isActive = true
        vietnamMoneyInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        vietnamMoneyInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        vietnamMoneyInput.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        moneyExchangeButton.topAnchor.constraint(equalTo: vietnamMoneyInput.bottomAnchor, constant: 50).isActive = true
        moneyExchangeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moneyExchangeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        moneyExchangeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        japanMoneyLabel.topAnchor.constraint(equalTo: moneyExchangeButton.bottomAnchor, constant: 30).isActive = true
        japanMoneyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        japanMoneyLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        japanMoneyInput.topAnchor.constraint(equalTo: japanMoneyLabel.bottomAnchor).isActive = true
        japanMoneyInput.leadingAnchor.constraint(equalTo: vietnamMoneyInput.leadingAnchor).isActive = true
        japanMoneyInput.trailingAnchor.constraint(equalTo: vietnamMoneyInput.trailingAnchor).isActive = true
        japanMoneyInput.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
