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
            
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configure()
    }
    
    private func configure(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(verticalStackView)
        
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
        
        [posterSectionView,newSectionView,watgorithmSectionView,upcomingSectionView,partySectionview].forEach{verticalStackView.addArrangedSubview($0)}

    }
}
