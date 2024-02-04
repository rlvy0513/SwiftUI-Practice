import SwiftUI

struct GraphCapsule: View, Equatable {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double> // Capsule의 값을 의미
    var overallRange: Range<Double> // 전체 Capsule들을 한꺼번에 봤을 때의 range값

    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

#Preview {
    GraphCapsule(
        index: 0,
        color: .blue,
        height: 150,
        range: 10..<50,
        overallRange: 0..<100)
}
