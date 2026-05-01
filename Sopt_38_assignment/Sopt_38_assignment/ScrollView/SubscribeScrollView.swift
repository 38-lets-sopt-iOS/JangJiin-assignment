//
//  SubscribeScrollView.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import SnapKit
import Then

class BaseScrollView: UIScrollView{
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("Not implemented xib init")
    }
    func configure(){}
    func bind(){}
}

final class SubscribeScrollView: BaseScrollView{
    private let sectionType: PosterSectionType
    
    init(sectionType: PosterSectionType, dataSource: [PosterModel]? = nil) {
        self.sectionType = sectionType
        self.dataSource = dataSource
        super.init(frame: .zero)
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 15
    }
    
    var dataSource: [PosterModel]? {
        didSet{ bind() }
    }
    
    override func configure(){
        super.configure()
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalTo(contentLayoutGuide)
            $0.height.equalTo(sectionType.itemSize.height)
        }
    }
    
    override func bind(){
        super.bind()
        
        stackView.arrangedSubviews.forEach{
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        dataSource?.forEach{data in let imageView = UIImageView().then{
            $0.image = data.image
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }
            
            stackView.addArrangedSubview(imageView)
            
            imageView.snp.makeConstraints{
                $0.width.equalTo(sectionType.itemSize.width)
                $0.height.equalTo(sectionType.itemSize.height)
            }
        }
    }
}
