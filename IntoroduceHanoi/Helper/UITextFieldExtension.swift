//
//  UITextFieldExtension.swift
//  IntoroduceHanoi
//
//  Created by 安井春輝 on 10/2/30 H.
//  Copyright © 30 Heisei haruki yasui. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPadding(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
