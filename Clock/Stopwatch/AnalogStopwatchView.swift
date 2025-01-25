//
//  AnalogStopwatchView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct AnalogStopwatchView: View {
  @ObservedObject var viewModel: StopwatchViewModel
  @Environment(\.colorScheme) var colorScheme
  @State var progress: Double = 0
  
  private let secondHandWidth: CGFloat = 1
  private let minuteMarkerWidth: CGFloat = 10
  
  var body: some View {
    GeometryReader { geometry in
      let size = min(geometry.size.width, geometry.size.height)
      
      ZStack {
        // Background
        Circle()
          .fill(Color.green)
        
        // Outer minute markers
        ForEach(0..<240) { marker in
          Rectangle()
            .fill(marker % 5 == 0 ? Color.white : Color.gray.opacity(0.3))
            .frame(
              width: marker % 5 == 0 ? 5 : 5,
              height: marker % 5 == 0 ? 20 : 10
            )
            .offset(y: -size * 0.48)
            .rotationEffect(.degrees(Double(marker) * 6))
        }
        
        // Numbers
        ForEach(0..<12) { number in
          Text("\(number * 5)")
            .font(.system(size: size * 0.08, weight: .regular))
            .foregroundColor(.white)
            .rotationEffect(.degrees(-Double(number) * 30))
            .offset(y: -size * 0.38)
            .rotationEffect(.degrees(Double(number) * 30))
        }
        
        // Inner circle with minute markers
        Circle()
          .stroke(Color.gray.opacity(0.3), lineWidth: 1)
          .frame(width: size * 0.33, height: size * 0.33)
        
        ForEach(0..<30) { marker in
          Rectangle()
            .fill(Color.gray.opacity(0.3))
            .frame(width: minuteMarkerWidth, height: size * 0.013)
            .offset(y: -size * 0.083)
            .rotationEffect(.degrees(Double(marker) * 12))
        }
        
        StopwatchHand(progress: $progress)
        
        // Digital time display
        Text(viewModel.formattedTime)
          .font(.system(size: size * 0.08, weight: .light, design: .monospaced))
          .foregroundColor(.white)
          .offset(y: size * 0.2)
      }
      .frame(width: size, height: size)
      .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
    }
  }
}

#Preview {
  AnalogStopwatchView(viewModel: .init())
}
