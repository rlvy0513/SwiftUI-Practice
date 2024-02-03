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
        // 스크롤 뷰는 내부 컨텐츠의 크기만큼 영역 차지
        ScrollView {
            // 지도 표시
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top) // ignoreSafeArea를 통해 위쪽 safeArea를 침범하지 않도록 설정
                .frame(height: 300)

            // 이미지 표시
            // CircleImage를 추가하고 offset을 통해서 맵 위에 이미지가 얹혀지는 형태로 구현
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
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline) // 네비게이션 타이틀을 위쪽 중앙으로 배치
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
