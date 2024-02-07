//
//  CategoryRow.swift
//  Landmark
//
//  Created by 기 표 on 2/2/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            // VStack안에 하나의 Text와 ScrollView 구현
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // ScrollView안에 HStack을 넣는 이유
            // HStack을 넣으면 자동으로 높이의 min,max값이 정해져서 내부 크기가 정해져서 구현돼서.
            // HStack안에 ScrollView를 쓰면 세로로 배치돼서 스크롤만 옆으로 됨
            ScrollView(.horizontal, showsIndicators: false) {
                // ScrollView 안에 HStack을 이용하여 리스트 구현
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        // NavigationLink에는 다음 화면이 올 Detail로 정의
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            // 보여지는 화면은 위에서 정의한 CategoryItem으로 선언
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}

