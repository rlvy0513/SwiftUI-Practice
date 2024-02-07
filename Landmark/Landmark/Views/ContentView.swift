//
//  ContentView.swift
//  Landmark
//
//  Created by 기 표 on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    // Tab의 케이스를 정의하고, 이 케이스를 갖고있는 상태 프로퍼티도 선언(@State)
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // TabView(selection:)으로 selection 상태를 정의하고 클로저 내부에서 TabView안에 들어갈 뷰들을 구현
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
