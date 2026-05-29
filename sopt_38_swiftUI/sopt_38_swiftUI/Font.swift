//
//  Font.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

extension Font {
    
    static func pretendardBold(size: CGFloat) -> Font {
        .custom("Pretendard-Bold", size: size)
    }
    static func pretendardSemiBold(size: CGFloat) -> Font {
        .custom("Pretendard-SemiBold", size: size)
    }
    static func pretendardMedium(size: CGFloat) -> Font {
        .custom("Pretendard-Medium", size: size)
    }
    static func pretendardLight(size: CGFloat) -> Font {
        .custom("Pretendard-Light", size: size)
    }
}
