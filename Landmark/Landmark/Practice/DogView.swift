//
//  DogView.swift
//  Landmark
//
//  Created by 기 표 on 1/24/24.
//

import SwiftUI

struct DogView: View {
    var body: some View {
        Image("dog")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.orange, lineWidth: 4)
            }
            .shadow(radius: 15)
    }
    
}

#Preview {
    DogView()
}

/*
 Assets에 사진 추가
 
 DogView에 Image()로 표출
 SwiftUI는 clipShape()를 통해 이미지를 Circle형태로 만들기 쉬움
 overay { }를 통해 테두리에 선 긋기
 shadow()를 통해 그림자 효과 적용
 */
