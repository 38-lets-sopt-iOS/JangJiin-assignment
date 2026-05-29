//
//  ContentView.swift
//  sopt_38_swiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 1
    init() {
        let appearance = UITabBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .watchaGray500
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.watchaGray500
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView (selection: $selectedTab){
            SubscribeView()
                .tabItem {
                    Image(.subscribe)
                    Text("구독")
                }
                .tag(1)
            
            Text("개별구매")
                .tabItem {
                    Image(.wallet)
                    Text("개별구매")
                }
                .tag(2)
            
            Text("웹툰")
                .tabItem {
                    Image(.category)
                    Text("웹툰")
                }
                .tag(3)

            Text("찾기")
                .tabItem {
                    Image(.search)
                    Text("찾기")
                }
                .tag(4)

            Text("보관함")
                .tabItem {
                    Image(.folder)
                    Text("보관함")
                }
                .tag(5)

        }
        .font(.headline)
        .tint(.white)
    }
}
