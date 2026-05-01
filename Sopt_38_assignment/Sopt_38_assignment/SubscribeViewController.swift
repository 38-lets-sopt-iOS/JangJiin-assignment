//
//  SubscribeViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//

import UIKit

import SnapKit
import Then

class SubscribeViewController: UIViewController{
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let posterSectionView = PosterSectionView()
    private let newSectionView = NewSectionView()
    private let watgorithmSectionView = WatgorithmSectionView()
    private let upcomingSectionView = UpcomingSectionView()
    private let partySectionview = PartySectionView()
    
    private let verticalStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 20
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .head2
        $0.text = "구독"
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
        setLayout()
    }
    
    private func setUI(){
        [scrollView,titleLabel].forEach{
            view.addSubview($0)
        }
        scrollView.addSubview(contentView)
        contentView.addSubview(verticalStackView)
        
        [posterSectionView,newSectionView,watgorithmSectionView,upcomingSectionView,partySectionview].forEach{verticalStackView.addArrangedSubview($0)}
    }
    
    private func setLayout(){
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        verticalStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(73)
            $0.leading.equalToSuperview().inset(30)
            
        }
    }
}
