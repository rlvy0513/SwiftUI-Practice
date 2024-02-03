//
//  LandmarkApp.swift
//  Landmark
//
//  Created by 기 표 on 1/23/24.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
            
        }
    }
}

// 앱의 윈도우를 관리하는 파일, ContentView()를 부르고있는 형태
