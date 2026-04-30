//
//  WelcomeViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/24/26.
//
import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    var nickname: String = ""
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .head2
        return label
    }()
    
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "watcha")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = .medium
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .watchaPink
        button.layer.cornerRadius = 14
        
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func mainButtonTapped(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
        setLayout()
        bindNickname()
    }
    
    private func setUI(){
        [titleImage, welcomeLabel, mainButton].forEach {view.addSubview($0)}
    }
    
    private func setLayout() {
        titleImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(70)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(319)
            $0.height.equalTo(167)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(45)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        }
        
        mainButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(26)
            $0.height.equalTo(58)
        }
    }
    
    private func bindNickname() {
        welcomeLabel.text = nickname.isEmpty
        ? "회원님\n가입을 환영합니다!"
        : "\(nickname)님\n가입을 환영합니다!"
    }
}
