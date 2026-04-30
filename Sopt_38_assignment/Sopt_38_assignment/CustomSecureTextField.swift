//
//  CustomSecureTextField.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/30/26.
//

import UIKit

class CustomSecureTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        
        if isSecureTextEntry, let currentText = text, !currentText.isEmpty {
            deleteBackward()
            insertText(currentText)
        }
        
        return result
    }
}
