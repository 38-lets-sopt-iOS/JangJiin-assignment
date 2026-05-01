//
//  PartyCardView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import Then
import SnapKit

final class PartyCardView: UIView{
    private let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }
    
    private let timeLabel = UILabel().then{
        $0.font = .body1
        $0.textColor = .watchaPink
    }
    
    private let titleLabel = UILabel().then{
        $0.font = .subhead3
        $0.textColor = .white
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .gray600
        
        [imageView,timeLabel,titleLabel].forEach{addSubview($0)}
        
        imageView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(139)
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(timeLabel.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
    }
    
    func configure(image: UIImage, time: String, title: String){
        imageView.image = image
        timeLabel.text = time
        titleLabel.text = title
    }
}
