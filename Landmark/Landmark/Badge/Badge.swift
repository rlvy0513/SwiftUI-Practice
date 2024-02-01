//
//  Badge.swift
//  Landmark
//
//  Created by 기 표 on 2/1/24.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360.0)
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            // GeometryReader는 기존의 VStack과 HStack에서 값을 제공한것을 그대로 사용하는것이 아닌
            // 제공된 값에서 함수를 통해, 직접 사이즈를 설정하고 위치할수 있도록 만들어둔 View를 의미한다.
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
