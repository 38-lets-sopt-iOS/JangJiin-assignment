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
    
    private let moreLabel = UILabel().then{
        $0.text = "더보기"
        $0.font = .cap1
        $0.textColor = .gray100
    }
    
    private let posterScrollView = SubscribeScrollView(sectionType: .smallPoster)
    
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
        [titleLabel,posterScrollView,moreLabel].forEach{
            addSubview($0)
        }
    }
    
    private func setLayout(){
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
        
        moreLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(22)
        }
    }
    
    private func bind(){
        posterScrollView.dataSource = Mocks.getUpcomingDataSource()
    }
}
