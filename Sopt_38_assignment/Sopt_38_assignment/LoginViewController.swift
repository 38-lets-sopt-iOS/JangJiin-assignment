//
//  LoginViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/19/26.
//
import UIKit
import Foundation
import SnapKit

extension String {
    var isValidEmail: Bool {
        let regularExpression =
        "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"

        let predicate =
        NSPredicate(format: "SELF MATCHES %@", regularExpression)

        return predicate.evaluate(with: self)
    }
    var isValidPW: Bool {
            let regularExpression =
            "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{10,}$"

            let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpression)

            return predicate.evaluate(with: self)
        }
}

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

        container.addSubview(clearButton)
        container.addSubview(checkImageView)

        self.rightView = container
        self.rightViewMode = mode
    }

    @objc
    private func clear(sender: AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
}

class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "로그인/가입하려는\n이메일을 입력해주세요"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font =
        UIFont(name: "Pretendard-SemiBold", size: 23)

        return label
    }()

    private let explainLabel: UILabel = {
        let label = UILabel()
        label.text =
        "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력하세요"
        label.textColor = UIColor.gray100
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font =
        UIFont(name: "Pretendard-Medium", size: 12)

        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()

        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 47))

        textField.leftViewMode = .always
        textField.textAlignment = .left
        textField.placeholder = "email@address.com"
        textField.setPlaceholder(color: .gray400)

        textField.font =
        UIFont(name: "Pretendard-Regular", size: 12)

        textField.backgroundColor = .gray600
        textField.textColor = .white
        textField.layer.cornerRadius = 5
        textField.tintColor = .watchaPink

        textField.rightView = nil
        textField.rightViewMode = .never

        return textField
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()

        button.setTitle("다음", for: .normal)
        button.setTitleColor(.gray200, for: .normal)

        button.titleLabel?.font =
        UIFont(name: "Pretendard-Medium", size: 18)

        button.backgroundColor = .gray400
        button.layer.cornerRadius = 5
        button.isEnabled = false

        button.addTarget(
            self,
            action: #selector(nextButtonDidtapped),
            for: .touchUpInside
        )

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setLayout()
        setTarget()
    }

    private func setLayout() {
        [titleLabel, explainLabel, emailTextField, nextButton].forEach {
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(152)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(205)
            $0.height.equalTo(55)
        }
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel)
            $0.width.equalTo(272)
            $0.height.equalTo(30)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(26)
            $0.height.equalTo(56)
        }
    }

    private func setTarget() {
        emailTextField.addTarget(
            self,
            action: #selector(textDidBegin),
            for: .editingDidBegin
        )

        emailTextField.addTarget(
            self,
            action: #selector(textDidEnd),
            for: .editingDidEnd
        )

        emailTextField.addTarget(
            self,
            action: #selector(textChanged),
            for: .editingChanged
        )
    }

    @objc
    private func nextButtonDidtapped() {
        let vc = PasswordViewController()
        vc.email = emailTextField.text
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc
    func textDidBegin(_ sender: UITextField) {
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.gray400.cgColor
    }

    @objc
    func textDidEnd(_ sender: UITextField) {
        sender.layer.borderWidth = 0
    }

    @objc
    func textChanged(_ sender: UITextField) {

        guard let text = sender.text else { return }

        if text.isEmpty {
            sender.rightView = nil
            sender.rightViewMode = .never

            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray400
            nextButton.setTitleColor(.gray200, for: .normal)

            return
        }

        let isValid = text.isValidEmail

        sender.setClearButton(
            with: UIImage(named: "clear")!,
            mode: .always,
            isValid: isValid
        )

        nextButton.isEnabled = isValid
        nextButton.backgroundColor =
        isValid ? .watchaPink : .gray400

        nextButton.setTitleColor(
            isValid ? .white : .gray200,
            for: .normal
        )
    }
}
