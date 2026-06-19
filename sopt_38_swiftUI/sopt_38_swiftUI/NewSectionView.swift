//
//  NewSectionView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//
import SwiftUI

struct NewSectionView: View {
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 3) {
                Text("방금 막 도착한 신상 컨텐츠")
                    .padding(.leading, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.pretendardSemiBold(size: 20))
                
                Text("예능부터 드라마까지!")
                    .padding(.leading, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.pretendardSemiBold(size: 18))
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    Image(.image6)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image7)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image10)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image6)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image7)
                        .resizable()
                        .frame(width: 321, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}
