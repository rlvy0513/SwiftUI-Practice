//
//  LandmarkList.swift
//  Landmark
//
//  Created by 기 표 on 1/24/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        /* 111
         List {
         LandmarkRow(landmark: landmarks[0])
         LandmarkRow(landmark: landmarks[1])
         }
         */
        
        /* 222
         List(landmarks, id: \.id) { landmark in
         LandmarkRow(landmark: landmark)
         }
         */
        NavigationSplitView { // 네비케이션
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink { // 랜드마크 디테일 추가
                        LandmarkDetail(landmark: landmark)
                    }label: { // 랜드마크로우 추가
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
                .animation(.default, value: filteredLandmarks)
                .navigationTitle("Landmarks")
            } detail: {
                Text("Select a Landmark")
            }
        }
    }

#Preview {
    LandmarkList()
}
