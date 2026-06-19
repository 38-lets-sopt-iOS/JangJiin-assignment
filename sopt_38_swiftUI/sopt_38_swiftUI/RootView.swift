//
//  RootView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct RootView: View {
    
    @State private var isEntered: Bool = false
    
    var body: some View {
        if isEntered {
            ContentView()
        } else {
            WelcomeView(isEntered: $isEntered)
        }
    }
}
