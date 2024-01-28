//
//  LandmarkRow.swift
//  Landmark
//
//  Created by 기 표 on 1/24/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    /*
     VStack과 비슷한 역할을 하는 Struct
     
     VStack 처럼 사용할 수 있으며, VStack과 가장 큰 차이점은 Group은 11개 이상의 child를 가질 수 있다는 점
     
     View Builder를 사용하여 뷰 그룹을 작성하기 때문에 Group의 이니셜라이저를 사용하여 조건부에서 다른 종류의 뷰를 생성한 다음 선택적으로 수정자를 적용할 수 있다.
     */
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
