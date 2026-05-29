//
//  WatgorithmSectionView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//
import SwiftUI

struct WatgorithmSectionView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                VStack(alignment: .leading, spacing: 8.5) {
                    Image(.왓고리즘)
                        .resizable()
                        .frame(width: 79, height: 25.5)
                    
                    Text("예능부터 드라마까지!")
                        .foregroundColor(.watchaLightGray)
                        .font(.pretendardSemiBold(size: 18))
                }
                
                Spacer()
                
                Text("더보기")
                    .foregroundColor(.white)
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
