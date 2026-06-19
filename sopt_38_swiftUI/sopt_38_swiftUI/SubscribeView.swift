//
//  SubscribeView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct SubscribeView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack(spacing: 20) {
                    Image(.video)
                    Image(.notification)
                    Image(.profile)
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 17)
            
            Text("구독")
                .padding(.leading, 28)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .font(.pretendardSemiBold(size: 30))
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 45) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            Image(.image1)
                                .resizable()
                                .frame(width: 273, height: 399)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Image(.image2)
                                .resizable()
                                .frame(width: 273, height: 399)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Image(.image9)
                                .resizable()
                                .frame(width: 273, height: 399)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding(.bottom, 35)
                
                VStack(spacing: 45) {
                    NewSectionView()
                    WatgorithmSectionView()
                    CommingSectionView()
                    PartySectionView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
