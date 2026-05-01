//
//  PosterModel.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//

import UIKit

enum PosterSectionType{
    case largePoster
    case smallPoster
    case largeHorizontalPoster
    case smallHorizontalPoster
    
    var itemSize: CGSize{
        switch self{
        case .largePoster: return CGSize(width: 273, height: 399)
        case .smallPoster: return CGSize(width: 103, height: 153)
        case .largeHorizontalPoster: return CGSize(width: 321, height: 180)
        case .smallHorizontalPoster: return CGSize(width: 196, height: 139)
        }
    }
}

struct PosterModel{
    enum DataModelType: String{
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
    }
    
    let type : DataModelType
    
    var name: String{
        return type.rawValue
    }
    
    var image: UIImage{
        switch type{
        case .one: return .월간남친
        case .two: return .크라임씬세로
        case .three: return .image12
        case .four: return .image9
        case .five:  return .이통되
        case .six: return .크라임씬가로
        case .seven: return .파묘
        case .eight: return .폭삭속았수다
        case .nine: return .menifest
        }
    }
}

struct Mocks{
    static func getPosterDataSource() -> [PosterModel]{
        return[PosterModel(type: .one),
               PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .four),
               PosterModel(type: .two)
        ]
    }
    static func getNewDataSource() -> [PosterModel]{
        return[PosterModel(type: .six),
               PosterModel(type: .eight),
               PosterModel(type: .nine),
               PosterModel(type: .six),
               PosterModel(type: .eight)
        ]
    }
    static func getWatgorithmDataSource() -> [PosterModel]{
        return[PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .four),
               PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .four),
               PosterModel(type: .five),
               PosterModel(type: .three)]
    }
    static func getUpcomingDataSource() -> [PosterModel]{
        return[PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .four),
               PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .five),
               PosterModel(type: .three),
               PosterModel(type: .four),
               PosterModel(type: .five),
               PosterModel(type: .three)]
    }
    
}
