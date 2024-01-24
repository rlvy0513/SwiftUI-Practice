//
//  DogView.swift
//  Landmark
//
//  Created by 기 표 on 1/24/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 15)
    }
    
}

#Preview {
    CircleImage()
}
