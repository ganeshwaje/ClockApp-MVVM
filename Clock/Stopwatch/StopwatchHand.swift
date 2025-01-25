//
//  StopwatchHand.swift
//  Clock
//
//  Created by Ganesh Waje on 25/01/25.
//

import SwiftUI

struct StopwatchHand: View {
  @Binding var progress: Double
  
  var body: some View {
    GeometryReader { geometry in
      Path { path in
        let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
        let radius = min(geometry.size.width, geometry.size.height) / 2
        
        // Main needle
        // Back portion of the needle
        path.move(to: CGPoint(
          x: center.x - radius * 0.2 * sin(2 * .pi * progress),
          y: center.y + radius * 0.2 * cos(2 * .pi * progress)
        ))
        
        // Front portion of the needle
        path.addLine(to: CGPoint(
          x: center.x + radius * sin(2 * .pi * progress),
          y: center.y - radius * cos(2 * .pi * progress)
        ))
      }
      .stroke(Color.red, lineWidth: 2)
      
      // Center circle overlay
      Circle()
        .fill(Color.white)
        .frame(width: 12, height: 12)
        .blendMode(.sourceAtop)
        .position(
          x: geometry.size.width / 2,
          y: geometry.size.height / 2
        )
      
      // Center circle ring
      Circle()
        .stroke(Color.red, lineWidth: 2)
        .frame(width: 8, height: 8)
        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
        .position(
          x: geometry.size.width / 2,
          y: geometry.size.height / 2
        )
      
    }
  }
}
