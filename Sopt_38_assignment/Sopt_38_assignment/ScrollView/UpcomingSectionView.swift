//
//  UpcomingSectionView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import SnapKit
import Then

final class UpcomingSectionView: UIView{
    
    private let titleLabel = UILabel().then{
        $0.text = "공개 예정 콘텐츠"
        $0.font = .head3
        $0.textColor = .white
    }
    
    private let posterScrollView = SubscribeScrollView(sectionType: .smallPoster)
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        [titleLabel,posterScrollView].forEach{
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        posterScrollView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.height.equalTo(PosterSectionType.smallPoster.itemSize.height)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }
    private func bind(){
        posterScrollView.dataSource = Mocks.getUpcomingDataSource()
    }
}
