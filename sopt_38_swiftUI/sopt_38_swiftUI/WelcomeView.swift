//
//  WelcomeView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var isEntered: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(.watcha)
                .resizable()
                .frame(width: 319, height: 167)
            
            Spacer().frame(height: 54)

            Text("회원님\n가입을 환영합니다")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(.pretendardSemiBold(size: 23))
            
            Spacer()
            
            Button(action: {
                isEntered = true
            }) {
                Text("메인으로")
                    .foregroundColor(.white)
                    .frame(width: 331, height: 56)
                    .background(Color("watchaPink"))
                    .font(.pretendardMedium(size: 18))
                    .cornerRadius(10)
            }
            
            Spacer().frame(height: 47)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
