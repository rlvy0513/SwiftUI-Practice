//
//  DogView.swift
//  Landmark
//
//  Created by 기 표 on 1/24/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 15)
    }
    
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
