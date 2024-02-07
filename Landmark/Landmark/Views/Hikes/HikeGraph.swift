import SwiftUI

struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observation, Range<Double>>
    /*
     path에 KeyPath를 사용하는 이유
            KeyPath를 사용하면 프로퍼티를 enum타입의 case와 같이 사용이 가능
            (switch로 분류하여 각각 프로퍼티에 해당되는 값 분기가 가능함)
     
     KeyPath 사용법
        첫 번째 인수 값(Hike.Observation) 사용 - 조건문에서 사용
        '(path ==\.elevation)'
        두 번째 인수 값 사용 - '인스턴스[keyPath: Path]' (각 프로퍼티에 해당되는 값을 얻을 수 있음)
     */
    var color: Color {
        // KeyPath를 통해 분기하여 각 프로퍼티마다 색상을 다르게 적용
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }

    var body: some View {
        let data = hike.observations
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange
                    )
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

// 각 데이터를 처리하여 적절한 값을 가져오게하는 헬퍼함수 정의
func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    range.upperBound - range.lowerBound
}

#Preview {
    let hike = ModelData().hikes[0]
    return Group {
        HikeGraph(hike: hike, path: \.elevation)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.heartRate)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.pace)
            .frame(height: 200)
    }
}
