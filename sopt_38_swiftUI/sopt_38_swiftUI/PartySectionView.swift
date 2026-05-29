//
//  NewSectionView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//
import SwiftUI

struct PartySectionView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("왓챠 파티")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.pretendardSemiBold(size: 20))
                
                Spacer()
                
                Text("더보기")
                    .foregroundColor(.watchaLightGray)
                    .font(.pretendardLight(size: 12))
                    .padding(.top, 15)
            }
            .padding(.horizontal, 22)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    PartyCardComponent(
                        image: .image14,
                        title: "# 왕과 사는 남자",
                        timeText: "오늘 21:13에 시작"
                    )
                    
                    PartyCardComponent(
                        image: .image16,
                        title: "# 파묘",
                        timeText: "오늘 22:22에 시작"
                    )
                    
                    PartyCardComponent(
                        image: .image14,
                        title: "# 왕과 사는 남자",
                        timeText: "오늘 21:13에 시작"
                    )
                }
            }
        }
    }
}
