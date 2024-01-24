//
//  LandmarkList.swift
//  Landmark
//
//  Created by 기 표 on 1/24/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        /* 111
         List {
             LandmarkRow(landmark: landmarks[0])
             LandmarkRow(landmark: landmarks[1])
         }
         */
        
        /* 222
         List(landmarks, id: \.id) { landmark in
             LandmarkRow(landmark: landmark)
         }
         */
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
            
        }
    }
}

#Preview {
    LandmarkList()
}
