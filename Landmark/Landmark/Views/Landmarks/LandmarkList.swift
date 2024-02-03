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
                
                /*
                 셀을 선택하면 연관된 페이지가 뜨도록 Navigation 설정
                 1. NavigationLink 사용
                 2. 클로저 2개 삽입
                 3. 첫 번째 클로저에는 해당 셀을 탭 했을 때 이동할 화면
                 4. 두 번째 클로저에는 (label:) Rows 그대로 입력
                 */
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink { // 1
                        LandmarkDetail(landmark: landmark) // 3
                    }label: {
                        LandmarkRow(landmark: landmark) // 4
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            // .navigationTitle을 이용하면 아래로 스크롤하면 자연스럽게 타이틀이 위로 이동함
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
