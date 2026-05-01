//
//  PosterScrollView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import SnapKit
import Then

final class PosterSectionView: UIView{
    
    private let posterScrollView = SubscribeScrollView(sectionType: .largePoster)
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(posterScrollView)
    
        posterScrollView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(PosterSectionType.largePoster.itemSize.height)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }
    private func bind(){
        posterScrollView.dataSource = Mocks.getPosterDataSource()
    }
}

