//
//  UITextField+.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/30/26.
//

import UIKit

extension UITextField {
    
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else { return }
        
        attributedPlaceholder = NSAttributedString(
            string: string,
            attributes: [.foregroundColor: color]
        )
    }
    
    func setClearButton(
        with image: UIImage,
        mode: UITextField.ViewMode,
        isValid: Bool
    ) {
        
        let clearButton = UIButton(type: .custom)
        
        clearButton.setImage(
            image.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        
        clearButton.frame = CGRect(x: 0, y: 12, width: 24, height: 24)
        clearButton.imageView?.contentMode = .scaleAspectFit
        
        clearButton.addTarget(
            self,
            action: #selector(UITextField.clear(sender:)),
            for: .touchUpInside
        )
        
        let checkImageView = UIImageView(
            frame: CGRect(x: 32, y: 12, width: 24, height: 24)
        )
        
        checkImageView.image = UIImage(
            named: isValid ? "check-on" : "check-off"
        )?.withRenderingMode(.alwaysOriginal)
        
        checkImageView.contentMode = .scaleAspectFit
        
        let container = UIView(
            frame: CGRect(x: 0, y: 0, width: 64, height: 47)
        )
        
        [clearButton,checkImageView].forEach{container.addSubview($0)}
        
        self.rightView = container
        self.rightViewMode = mode
    }
    
    @objc
    private func clear(sender: AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
}
