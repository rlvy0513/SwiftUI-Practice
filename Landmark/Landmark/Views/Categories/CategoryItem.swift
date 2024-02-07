//
//  CategoryItem.swift
//  Landmark
//
//  Created by 기 표 on 2/2/24.
//

import SwiftUI


struct CategoryItem: View {
    var landmark: Landmark
    
    // 스크롤 뷰에 들어갈 아이템 1개 만들기
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
