//
//  WatgorithmSectionView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//
import SwiftUI

struct WatgorithmSectionView: View {
    
    private let imageList: [ImageResource] = [
        .image1, .image9, .image12, .image1, .image9,
        .image12, .image1, .image9, .image12, .image1
    ]
    
    private let rows = [
        GridItem(.fixed(153))
    ]
    
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
                LazyHGrid(rows: rows, spacing: 15) {
                    ForEach(imageList.indices, id: \.self) { index in
                        Image(imageList[index])
                            .resizable()
                            .frame(width: 103, height: 153)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
    }
}
