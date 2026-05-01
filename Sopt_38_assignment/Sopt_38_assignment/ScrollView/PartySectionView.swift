//
//  PartySectionView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import SnapKit
import Then

final class PartySectionView: UIView{
    
    private let titleLabel = UILabel().then{
        $0.text = "왓챠 파티"
        $0.font = .head3
        $0.textColor = .white
    }
    
    private let moreLabel = UILabel().then{
        $0.text = "더보기"
        $0.font = .cap1
        $0.textColor = .gray100
    }
    
    private let scrollView = UIScrollView().then{
        $0.showsVerticalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    
    private let stackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 15
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUI()
        setLayout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        [titleLabel,scrollView,moreLabel].forEach{addSubview($0)}
        scrollView.addSubview(stackView)
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        scrollView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(185)
            $0.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide)
        }
        
        moreLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(22)
        }
    }
    private func bind(){
        let cards: [(UIImage,String,String)]=[
            (.왕사남, "오늘 21:13에 시작","#왕과사는 남자"),
            (.파묘, "오늘 22:22에 시작","#파묘"),
            (.왕사남, "오늘 21:13에 시작","#왕과사는 남자")
        ]
        cards.forEach{image, time, title in let cardView = PartyCardView()
            cardView.configure(image: image, time: time, title: title)
            stackView.addArrangedSubview(cardView)
            cardView.snp.makeConstraints{
                $0.width.equalTo(196)
                $0.height.equalTo(185)
            }
        }
    }
}
