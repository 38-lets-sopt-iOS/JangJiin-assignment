//
//  NewSectionView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import SnapKit
import Then

final class NewSectionView: UIView{
    
    private let titleLabel = UILabel().then{
        $0.text = "방금 막 도착한 신상 컨텐츠"
        $0.font = .head3
        $0.textColor = .white
    }
    
    private let subtitleLabel = UILabel().then{
        $0.text = "예능부터 드라마까지!"
        $0.font = .subhead1
        $0.textColor = .gray100
    }
    
    private let posterScrollView = SubscribeScrollView(sectionType: .smallHorizontalPoster)
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        [titleLabel,posterScrollView,subtitleLabel].forEach{
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        posterScrollView.snp.makeConstraints{
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(PosterSectionType.smallHorizontalPoster.itemSize.height)
            $0.bottom.equalToSuperview()
        }
        
    }
    private func bind(){
        posterScrollView.dataSource = Mocks.getNewDataSource()
    }
}
