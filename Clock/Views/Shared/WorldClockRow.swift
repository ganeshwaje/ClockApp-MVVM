//
//  WorldClockRow.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct WorldClockRow: View {
  let clock: WorldClock
  @State private var currentTime = Date()
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(clock.city)
          .font(.headline)
        Text("Today, \(timeString)")
          .font(.caption)
          .foregroundColor(.secondary)
      }
      
      Spacer()
      
      Text(currentTime, style: .time)
        .font(.title2)
        .onReceive(timer) { _ in
          currentTime = Date().addingTimeInterval(TimeInterval(clock.hourDifference * 3600))
        }
    }
  }
  
  private var timeString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: currentTime)
  }
}
