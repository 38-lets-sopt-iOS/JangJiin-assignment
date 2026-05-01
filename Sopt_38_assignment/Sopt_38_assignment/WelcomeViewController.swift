//
//  WelcomeViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/24/26.
//
import UIKit

import SnapKit
import Then

class WelcomeViewController: UIViewController {
    
    var nickname: String = ""
    
    private let welcomeLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .head2
    }
    
    private let titleImage = UIImageView().then {
        $0.image = UIImage(named: "watcha")
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var mainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel?.font = .medium
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .watchaPink
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func mainButtonTapped(){
        let tabBarController = MainTabBarController()
        tabBarController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(tabBarController,animated: true)
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
