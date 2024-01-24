//
//  ContentView.swift
//  Landmark
//
//  Created by 기 표 on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // VStack의 생성자에서 alignment와 spacing 설정이 가능
        VStack(alignment: .leading, spacing: 1.5) {
            Text("Hello, world!")
                .font(.title)
            HStack {
                Text("sub text1")
                Spacer() // 스택 뷰 안에 공간 주는 것도 가능
                Text("sub text2")
                // Text 추가: shift + cmd + L (라이브러리) -> Text
            }
        }
        .padding()
    }
    // VStack이 왼쪽 오른쪽에 너무 딱 붙어 있으므로, padding을 주고 싶은 경우 padding을 사용
}

#Preview {
    ContentView()
}

/*
 ContentView라는 뷰 코드와 Preview코드가 나누어져서 존재
 
 Canvas 닫기/열기: cmd + option + enter
 Resume: cmd + option + P
 
 
 코드 부분을 위, 아래로 이동 단축키
 
 위로 이동: cmd + option + [
 아래로 이동: cmd + option + ]
 */
