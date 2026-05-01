//
//  WatgorithmSectionView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import SnapKit
import Then

final class WatgorithmSectionView: UIView{
    
    private let titleImage = UIImageView().then{
        $0.image = .왓고리즘
    }
    
    private let subtitleLabel = UILabel().then{
        $0.text = "예능부터 드라마까지!"
        $0.font = .subhead1
        $0.textColor = .gray100
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
        [titleImage,posterScrollView,subtitleLabel,moreLabel].forEach{
            addSubview($0)
        }
    }
    private func setLayout(){
        titleImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalTo(79)
            $0.height.equalTo(25.5)
            $0.leading.equalToSuperview().inset(24)
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleImage.snp.bottom).offset(3)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        
        posterScrollView.snp.makeConstraints{
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(15)
            $0.height.equalTo(PosterSectionType.smallPoster.itemSize.height)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview()
        }
        
        moreLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(22)
        }
        
    }
    private func bind(){
        posterScrollView.dataSource = Mocks.getWatgorithmDataSource()
    }
}

