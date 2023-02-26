//
//  ContentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            RecommendView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Recommend")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Profile")
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
