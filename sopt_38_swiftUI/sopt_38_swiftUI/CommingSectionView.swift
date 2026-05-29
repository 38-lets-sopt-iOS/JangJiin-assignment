//
//  NewSectionView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//
import SwiftUI

struct CommingSectionView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("공개 예정 콘텐츠")
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
                HStack(spacing: 15) {
                    Image(.image1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image9)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image12)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image9)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image12)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image9)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image12)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Image(.image1)
                        .resizable()
                        .frame(width: 103, height: 153)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}
