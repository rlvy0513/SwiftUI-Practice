//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by 기 표 on 1/25/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark


    var body: some View {
        VStack {
            // 지도 표시
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            // 이미지 표시
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text(landmark.name) // 랜드마크 이름
                    .font(.title)


                HStack { // 랜드마크 이름 아래 회색 택스트
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider() // 구분 선


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()


            Spacer()
        }
    }
}


#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
