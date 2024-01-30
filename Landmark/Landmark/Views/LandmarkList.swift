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
         // List의 첫번째 파라미터에는 배열을 주입
         }
         */
        
        /* 222
         List(landmarks, id: \.id) { landmark in
         LandmarkRow(landmark: landmark)
         // List의 두번재 파라미터에는 각 배열에 해당되는 id를 ketPath로 주입
         (즉, Model을 정의할 때는 Identifier 타입을 따르고 있어야 List에 데이터를 주입할 때도 용이함)
         클로저를 통해서 각 배열의 원소 접근
         }
         
         List는 자동으로 내부에 contentInset을 주어서 List와 내부 row간의 간격이 존재
         각 Row밑에 separator가 자동으로 생성
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
        .environment(ModelData())
}
