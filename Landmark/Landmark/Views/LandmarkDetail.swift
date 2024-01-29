//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by 기 표 on 1/25/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            // 지도 표시
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            // 이미지 표시
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name) // 랜드마크 이름
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

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
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
