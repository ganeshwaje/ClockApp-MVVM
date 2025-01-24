//
//  LapRow.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct LapRow: View {
  let index: Int
  let lap: TimeInterval
  
  var body: some View {
    HStack {
      Text("Lap \(index + 1)")
      Spacer()
      Text(formatTime(lap))
    }
  }
  
  private func formatTime(_ time: TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    let milliseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
    return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
  }
}
