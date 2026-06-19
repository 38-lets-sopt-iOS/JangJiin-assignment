//
//  PartyCardComponent.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct PartyCardComponent: View {
    
    let image: ImageResource
    let title: String
    let timeText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .topTrailing) {
                Image(image)
                    .resizable()
                    .frame(width: 196, height: 139)
                
                Image(.알림설정)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.top, 7)
                    .padding(.trailing, 5)
            }
            .frame(width: 196, height: 139)
            
            Text(timeText)
                .foregroundColor(.watchaPink)
                .font(.pretendardMedium(size: 12))
                .padding(.leading, 6)
    
            Text(title)
                .foregroundColor(.white)
                .font(.pretendardMedium(size: 12))
                .padding(.leading, 6)
                .padding(.bottom, 7)
        }
        .background(.cardBackground)
    }
}
